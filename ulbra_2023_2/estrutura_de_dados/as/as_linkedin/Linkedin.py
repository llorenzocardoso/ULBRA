import mysql.connector

from Database import Database

class Linkedin:
    def __init__(self, dbconfig) -> None:
        self.db = Database(dbconfig)
        pass
    
    def adicionar_contato(self, contato):
        self.db.adicionarContato(contato.id, contato.nome, contato.perfil_linkedin)

    def deletar_contato(self, id):
        self.db.deletarContato(id)

    def listar_contatos(self):
        return self.db.listarContatos()