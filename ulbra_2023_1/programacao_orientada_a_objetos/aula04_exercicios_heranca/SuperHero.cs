using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula04_exercicios_heranca
{
    public class SuperHero : Hero
    {
        public void SuperPower()
        {
            System.Console.WriteLine($"{this.Name} esta usando seu poder");
        }
    }
}