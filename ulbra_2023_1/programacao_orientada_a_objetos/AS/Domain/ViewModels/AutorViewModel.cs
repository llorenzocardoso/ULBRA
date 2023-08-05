using System.Collections.Generic;

namespace AS.Domain.ViewModels
{
    public class AutorViewModel
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public List<int> LivrosIds { get; set; }
    }
}
