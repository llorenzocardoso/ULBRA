using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula04_exercicios_heranca
{
    public class Cat : Animal
    {
        public Cat(string name):base(name){}

        public override void Speak()
        {
            Console.WriteLine("Miau!");
        }
    }
}