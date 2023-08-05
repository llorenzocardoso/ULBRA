using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ap1
{
    public class Estacionamento 
    {
        public int Id { get; set; }
        public Veiculo Veiculo { get; set; }

        public Estacionamento(int id, Veiculo veiculo)
        {
            this.Id = id;
            this.Veiculo = veiculo;
        }

        public void InfoVeiculo()
        {
            InfoVeiculo();
        }
    }

}