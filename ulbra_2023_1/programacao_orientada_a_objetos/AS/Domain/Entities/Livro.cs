using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace AS
{
    public class Livro
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public bool Emprestado { get; set; } 
        public ICollection<LivroAutor> Autores { get; set; }
    }
}