using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula02_exercicios
{
    public class ContaBancaria
    {
        public decimal Saldo;

        public void Depositar(decimal soma){
            Saldo += soma;
        }

        public void Sacar(decimal subtrair){
            Saldo -= subtrair;
        }

        public void DetalhesConta(){
            Console.WriteLine("O saldo atual da conta e: "+Saldo);
        }
    }
}