using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using aula12_ORM.Domain.Entities;

namespace aula12_ORM.Domain.Interfaces
{
    public interface IPersonRepository : IBaseRepository<Person>
    {
        
    }
}