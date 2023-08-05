using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// Crie uma classe base chamada "Veiculo" que tenha uma propriedade "Modelo" e um método "Acelerar()". Em seguida, crie duas classes derivadas chamadas "Carro" e "Moto" que herdam da classe "Veiculo" e implementam o método "Acelerar()" de maneiras diferentes. Por exemplo, o método "Acelerar()" da classe "Carro" pode imprimir "Acelerando carro!", enquanto o método "Acelerar()" da classe "Moto" pode imprimir "Acelerando moto!". Teste o código na classe program.

namespace aula04_exercicios_heranca
{
    public abstract class Vehicle
    {
        public string Model{get;set;}

        public Vehicle(string model)
        {
            this.Model = model;
        }

        public abstract void Accelerate();
    }
}