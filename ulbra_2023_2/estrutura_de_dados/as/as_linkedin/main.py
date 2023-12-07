from Contato import Contato
from Linkedin import Linkedin

def menu():
    while True:
        print('\n1. Adicionar Contato')
        print('2. Listar Contatos')
        print('3. Excluir Contato')
        print('0. Sair')

        escolha = input("Escolha uma opção: ")

        if escolha == "1":
            id = input("ID do contato: ")
            nome = input("Nome do contato: ")
            perfil_linkedin = input("Perfil do Linkedin: ")
            contato = Contato(id, nome, perfil_linkedin)
            linkedin.adicionar_contato(contato)

        elif escolha == "2":
            contatos = linkedin.listar_contatos()
            print('Lista de Contatos')
            for contato in contatos:
                print(f"ID: {contato[0]}, Nome: {contato[1]}, Perfil Linkedin {contato[2]}")

        elif escolha == "3":
            id = int(input("ID do contato a ser excluído: "))
            linkedin.deletar_contato(id)

        elif escolha == "0":
            break

        else:
            print("Opção inválida. Tente Novamente.")


if __name__ == "__main__":
    db_config = {
        'user':'turma6ntop',
        'password':'turma6ntop',
        'host':'db4free.net',
        'database':'linkedin6n',
        'port': 3306
    }
    linkedin = Linkedin(db_config)
    menu()