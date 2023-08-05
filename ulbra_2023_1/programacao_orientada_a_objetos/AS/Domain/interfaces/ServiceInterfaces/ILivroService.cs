using System.Collections.Generic;

namespace AS
{
    public interface ILivroService
    {
        List<Livro> GetAllLivros();
        Livro GetLivroById(int id);
        void CreateLivro(Livro livro);
        void UpdateLivro(Livro livro);
        void DeleteLivro(int id);
        void AdicionarAutor(Livro livro, Autor autor);
    }
}
