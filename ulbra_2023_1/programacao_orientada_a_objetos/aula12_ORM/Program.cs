using aula12_ORM.Data;
using aula12_ORM.Data.Repositories;
using aula12_ORM.Domain.Entities;

var db = new DataContext();
var personRepository = new PersonRepository(db);

// Console.WriteLine("Inserting a new person using repository person");
// var person = new Person { Id = 3, Name = "Cassio Costa", PhoneNumber = "55125132323" };
// personRepository.Save(person);

listPeople();

var personFind = personRepository.GetById(1);

Console.WriteLine($"Id: {personFind.Id} | Nome: {personFind.Name} | Fone: {personFind.PhoneNumber}");

Console.WriteLine("delete person id 3");
personRepository.Delete(3);

listPeople();

void listPeople()
{
    Console.WriteLine("listing people");
    var people = personRepository.GetAll();

    foreach (var item in people)
    {
        Console.WriteLine($"Id: {item.Id} | Nome: {item.Name} | Fone: {item.PhoneNumber}");
    }
}