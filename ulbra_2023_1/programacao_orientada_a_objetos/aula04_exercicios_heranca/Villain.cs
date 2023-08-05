using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula04_exercicios_heranca
{
    public class Villain : Character
    {
        public void FightHero(Hero hero)
        {
            base.Fight(hero);
        }
    }
}