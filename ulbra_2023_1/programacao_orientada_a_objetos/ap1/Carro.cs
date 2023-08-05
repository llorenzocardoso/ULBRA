using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ap1
{
    public class Carro : Veiculo // heranca
    {
        public int Ocupantes { get; set; }

        public Carro(string placa, int ocupantes) : base(placa)
        {
            Placa = placa;
            Ocupantes = ocupantes;
        }

        public override void InfoVeiculo() 
        {
            InfoVeiculo();
        }
 
    }
}