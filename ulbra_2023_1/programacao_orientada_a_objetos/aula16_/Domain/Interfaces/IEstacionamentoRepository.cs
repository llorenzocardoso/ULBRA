using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ap2.Domain.Entities;

namespace ap2.Domain.Interfaces
{
    public interface IEstacionamentoRepository : IBaseRepository<Estacionamento>
    {
        void AdicionarVeiculoNaVaga(int vagaId, Veiculo veiculo);
    }
}