using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ap2.Domain.Entities;
using ap2.Domain.Interfaces;

namespace ap2.Data.Repositories
{
    public class MotoRepository : IMotoRepository
    {
        private readonly DataContext context;

        public MotoRepository(DataContext context)
        {
            this.context = context;
        }
        public Moto BuscarId(int entityId)
        {
            return context.Motos.SingleOrDefault(a => a.Id == entityId);
        }

        public bool Delete(int entityId)
        {
            var m = BuscarId(entityId);
            context.Motos.Remove(m);
            context.SaveChanges();
            return true;
        }

        public IList<Moto> GetAll()
        {
            return context.Motos.ToList();
        }

        public void Save(Moto entity)
        {
            context.Add(entity);
            context.SaveChanges();
        }

        public void Update(Moto entity)
        {
            context.Motos.Update(entity);
            context.SaveChanges();
        }
    }
}