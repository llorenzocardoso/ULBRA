using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ap2.Domain.Entities;
using ap2.Domain.Interfaces;

namespace ap2.Data.Repositories
{
    public class EstacionamentoRepository : IEstacionamentoRepository
    {

        private readonly DataContext context;

        public EstacionamentoRepository(DataContext context)
        {
            this.context = context;
        }

        public void AdicionarVeiculoNaVaga(int vagaId, Veiculo veiculo)
        {
            var vaga = context.Vagas.SingleOrDefault(a => a.Id == vagaId);
            
            if (vaga != null)
            {
                vaga.Veiculo = veiculo;
                context.SaveChanges();
            }
            else
            {
                throw new Exception("Vaga não encontrada.");
            }
        }

        public Estacionamento BuscarId(int entityId)
        {
            return context.Vagas.SingleOrDefault(a => a.Id == entityId);
        }

        public bool Delete(int entityId)
        {
            var v = BuscarId(entityId);
            context.Vagas.Remove(v);
            context.SaveChanges();
            return true;
        }

        public IList<Estacionamento> GetAll()
        {
            return context.Vagas.ToList();
        }

        public void Save(Estacionamento entity)
        {
            context.Add(entity);
            context.SaveChanges();
        }

        public void Update(Estacionamento entity)
        {
            context.Vagas.Update(entity);
            context.SaveChanges(); 
        }

    }
}