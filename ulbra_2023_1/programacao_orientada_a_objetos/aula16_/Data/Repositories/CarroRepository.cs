using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ap2.Domain.Entities;
using ap2.Domain.Interfaces;

namespace ap2.Data.Repositories
{
    public class CarroRepository : ICarroRepository
    {
        private readonly DataContext context;
        public CarroRepository (DataContext context)
        {
            this.context = context;
        }

        public Carro BuscarId(int entityId)
        {
            return context.Carros.SingleOrDefault(x=>x.Id == entityId);
        }

        public bool Delete(int entityId)
        {
            var c = BuscarId(entityId);
            context.Carros.Remove(c);
            context.SaveChanges();
            return true;
        }

        public IList<Carro> GetAll()
        {
            return context.Carros.ToList();
        }

        public void Save(Carro entity)
        {
            context.Add(entity);
            context.SaveChanges();;
        }

        public void Update(Carro entity)
        {
            context.Carros.Update(entity);
            context.SaveChanges();
        }
    }
}