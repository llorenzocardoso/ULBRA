using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula02_exercicios
{
    public class Calculadora
    {
        public int result{get;set;}

        public int Calcular(int num1, int num2, string op){
            switch (op)
            {
                case "soma":
                    this.result = num1 + num2;
                break;
                case "subtrair":
                    this.result = num1 - num2;
                break;
            }
            return this.result;
        }
    }
}