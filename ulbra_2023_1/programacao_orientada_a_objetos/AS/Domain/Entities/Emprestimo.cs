using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AS
{
    public class Emprestimo
    {
        public int Id { get; set; }
        public int UsuarioId { get; set; }
        public Usuario Usuario { get; set; }
        public int LivroId { get; set; }
        public Livro Livro { get; set; }
    }
}