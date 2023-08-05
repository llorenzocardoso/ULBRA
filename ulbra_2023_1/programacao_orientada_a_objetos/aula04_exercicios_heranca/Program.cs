using System;

namespace aula04_exercicios_heranca;

class Program{
    static void Main(string []args)
    {
        // Atividade 1

        // Animal dog = new Dog("Lorenzo");
        // Console.WriteLine(dog.Name);
        // dog.Speak();

        // Animal cat = new Cat("Mel");
        // Console.WriteLine(""cat.Name);
        // cat.Speak();

        // Atividade 2

        // Vehicle car = new Car("Fusca");
        // Console.WriteLine(car.Model);
        // car.Accelerate();

        // Vehicle motorcycle = new Motorcycle("Fusca");
        // Console.WriteLine(motorcycle.Model);
        // motorcycle.Accelerate();

        // Atividade 3

        Character homemDeFerro = new Hero(){
            Name = "Homem de Ferro",
            Strength = 7,
            Intelligence = 6,
            Powers = new string []{"teste", "teste"}
        };

        Character thanos = new Villain(){
            Name = "Thanos",
            Strength = 10,
            Intelligence = 8,
            Powers = new string []{"teste", "teste"}
        };

        homemDeFerro.Fight(thanos);
    }
}