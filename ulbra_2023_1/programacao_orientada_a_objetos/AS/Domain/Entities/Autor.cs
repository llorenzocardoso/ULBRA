using System.Collections.Generic;
using AS;

namespace AS
{
    public class Autor
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public ICollection<LivroAutor> Livros { get; set; }
    }
}
