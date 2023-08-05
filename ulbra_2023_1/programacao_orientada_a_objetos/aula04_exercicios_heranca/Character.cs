using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// Crie uma classe base chamada "Personagem" que tenha propriedades como "Nome", "Força", "Inteligência" e "Poderes". Em seguida, crie duas classes derivadas chamadas "Heroi" e "Vilao" que herdam da classe "Personagem" e implementam métodos para lutar. Além disso, crie duas classes adicionais chamadas "SuperHeroi" e "SuperVilao" que herdam de "Heroi" e "Vilao", respectivamente, e adicionam um novo método "SuperPoder()". Cada personagem deve ter valores diferentes para suas propriedades, como por exemplo "Homem de Ferro" com alta inteligência e "Thanos" com alta força. Os métodos de luta devem ser implementados de forma a levar em consideração as propriedades de cada personagem, e os métodos "SuperPoder()" devem ser implementados de forma a exibir a mensagem apropriada para cada personagem.

namespace aula04_exercicios_heranca
{
    public class Character
    {
        public string Name{get; set;}
        public int Strength{get; set;}
        public int Intelligence{get; set;}
        public string [] Powers{get; set;}


        public void Fight(Character opponent)
        {
            Console.WriteLine($"{this.Name} ira lutar contra {opponent.Name}!!");

            int heroTotalStrength = this.Strength + this.Intelligence;
            int opponentTotalStrength = opponent.Strength + opponent.Intelligence;

            if (heroTotalStrength > opponentTotalStrength)
            {
                System.Console.WriteLine($"{this.Name} venceu a luta!!!!");   
            }else if (heroTotalStrength < opponentTotalStrength)
            {
                System.Console.WriteLine($"{opponent.Name} venceu a luta!!!");
            }else
            {
                System.Console.WriteLine("A luta terminou em um empate!!");
            }
        }
    }
}