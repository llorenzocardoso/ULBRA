using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula04_exercicios_heranca
{
    public class Motorcycle : Vehicle
    {
        
        public Motorcycle(string model):base(model){}

        public override void Accelerate()
        {
            Console.WriteLine("accelerating motorcycle");
        }

    }
}