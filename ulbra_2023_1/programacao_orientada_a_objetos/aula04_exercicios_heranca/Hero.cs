using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula04_exercicios_heranca
{
    public class Hero : Character
    {
        public void FightVillain(Villain villain)
        {
            base.Fight(villain);
        } 
    }
}