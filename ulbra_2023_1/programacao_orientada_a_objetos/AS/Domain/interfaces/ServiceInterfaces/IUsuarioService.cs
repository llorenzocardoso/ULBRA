using System.Collections.Generic;
using AS.Domain.DTOs;

namespace AS
{
    public interface IUsuarioService
    {
        List<Usuario> GetAllUsuarios();
        Usuario GetUsuarioById(int id);
        void CreateUsuario(Usuario usuario);
        void UpdateUsuario(Usuario usuario);
        void DeleteUsuario(int id);
        void EmprestarLivro(Usuario usuario, Livro livro); 
        void DevolverLivro(Usuario usuario, Livro livro); 
        public List<LivroDTO> ObterLivrosEmprestados(int usuarioId);
    }
}
