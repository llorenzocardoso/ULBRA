using System;

namespace ap1
{
    class Program
    {
        static EstacionamentoRepository repository = new EstacionamentoRepository();

        static void Main(string[] args)
        {

            Console.Clear();
            while (true)
            {
                Console.WriteLine("\nEscolha uma opção:");
                Console.WriteLine("1. Adicionar um veiculo ao estacionamento");
                Console.WriteLine("2. Buscar veiculo no estacionamento");
                Console.WriteLine("3. Listar todos os veiculos do estacionamento");
                Console.WriteLine("4. Remover veiculo do estacionamento");
                Console.WriteLine("5. Buscar veículo por placa");
                Console.WriteLine("6. Sair");

                string opcao = Console.ReadLine();

                switch (opcao)
                {
                    case "1":
                    Console.WriteLine("\nDigite o tipo de veiculo que será adicionado: ");
                    Console.WriteLine("1 - Moto");
                    Console.WriteLine("2 - Carro");
                    int tipo = Convert.ToInt32(Console.ReadLine());
                    if (tipo == 1)
                    {
                        AdicionarEstacionamento();
                    }else if (tipo == 2)
                    {
                        Console.Write("\nDigite quantos ocupantes esse carro possui: ");
                        int ocupantes = Convert.ToInt32(Console.ReadLine());
                        AdicionarEstacionamento(ocupantes);
                    } else
                    {
                        Console.WriteLine("\nTipo invalido!");
                    } 
                        break;

                    case "2":
                        BuscarEstacionamento();
                        break;

                    case "3":
                        ListarEstacionamentos();
                        break;

                    case "4":
                        RemoverEstacionamento();
                        break;

                    case "5":
                        BuscarPlaca();
                        break;

                    case "6":
                        Console.WriteLine("\nPrograma encerrado com sucesso!");
                        return;
                   
                    default:
                        Console.WriteLine("\nOpção inválida, tente novamente!");
                        break;
                }
            }
        }

        static void AdicionarEstacionamento() // adicionar motos SOBRECARGA
        {
            Console.Write("\nDigite o número da vaga do estacionamento: "); 
            int id = Convert.ToInt32(Console.ReadLine());

            Estacionamento estacionamento = repository.GetById(id);

            if (estacionamento != null)
            {
                Console.WriteLine("\nVaga já ocupada.");
                return;
            }

            Console.Write("Digite a placa do veículo: ");
            string placa = Console.ReadLine();
            Moto veiculo = new Moto(placa);

            Estacionamento newEstacionamento = new Estacionamento(id, veiculo);
            repository.Add(newEstacionamento);

            Console.WriteLine($"\nMoto adicionada na vaga {id} com sucesso!");
        }

        static void AdicionarEstacionamento(int ocupantes) // adicionar carros SOBRECARGA
        {
            Console.Write("\nDigite o número da vaga do estacionamento: ");
            int id = Convert.ToInt32(Console.ReadLine());

            Estacionamento estacionamento = repository.GetById(id);

            if (estacionamento != null)
            {
                Console.WriteLine("\nVaga já ocupada.");
                return;
            }

            Console.Write("Digite a placa do veículo: ");
            string placa = Console.ReadLine();
            Carro veiculo = new Carro(placa, ocupantes);

            Estacionamento newEstacionamento = new Estacionamento(id, veiculo);
            repository.Add(newEstacionamento);

            Console.WriteLine($"\nCarro adicionado na vaga {id} com sucesso!");
        }
        
        static void BuscarEstacionamento()
        {
            Console.Write("\nDigite o número da vaga no estacionamento: ");
            int id = Convert.ToInt32(Console.ReadLine());

            Estacionamento estacionamento = repository.GetById(id);

            if (estacionamento == null)
            {
                Console.WriteLine("\nVaga não encontrada.");
            }
            else
            {
                Console.WriteLine($"\nID: {estacionamento.Id}");
                Console.WriteLine($"Placa: {estacionamento.Veiculo.Placa}");
                    
                if (estacionamento.Veiculo is Carro carro)
                {
                    Console.WriteLine("Tipo: Carro");
                    Console.WriteLine($"Ocupantes: {carro.Ocupantes}");
                }
                else if (estacionamento.Veiculo is Moto moto)
                {
                    Console.WriteLine("Tipo: Moto");
                }
            }
        }
        
        static void ListarEstacionamentos()
        {
            foreach (Estacionamento estacionamento in repository.GetAll())
            {
                Console.WriteLine($"\nID: {estacionamento.Id}");
                Console.WriteLine($"Placa: {estacionamento.Veiculo.Placa}");
                
                if (estacionamento.Veiculo is Carro carro)
                {
                    Console.WriteLine("Tipo: Carro");
                    Console.WriteLine($"Ocupantes: {carro.Ocupantes}");
                }
                else if (estacionamento.Veiculo is Moto moto)
                {
                    Console.WriteLine("Tipo: Moto");
                }
            }
        }

        static void RemoverEstacionamento()
        {
            Console.Write("\nDigite o número da vaga para remover o veiculo: ");
            int id = Convert.ToInt32(Console.ReadLine());

            Estacionamento estacionamento = repository.GetById(id);

            if (estacionamento == null)
            {
                Console.WriteLine("\nVaga não encontrada.");
            }
            else
            {
                repository.Remove(estacionamento);
                Console.WriteLine("\nVeiculo removido com sucesso!");
            }
        }

        static void BuscarPlaca() // buscar veiculo por placa
        {
            Console.Write("\nDigite o número da placa do veiculo: ");
            string placa = Convert.ToString(Console.ReadLine());

            Estacionamento estacionamento = repository.BuscarPlaca(placa);

            if (estacionamento == null)
            {
                Console.WriteLine("\nVeiculo não encontrado.");
            }
            else
            {
                Console.WriteLine($"\nID: {estacionamento.Id}");
                Console.WriteLine($"Placa: {estacionamento.Veiculo.Placa}");
                    
                if (estacionamento.Veiculo is Carro carro)
                {
                    Console.WriteLine("Tipo: Carro");
                    Console.WriteLine($"Ocupantes: {carro.Ocupantes}");
                }
                else if (estacionamento.Veiculo is Moto moto)
                {
                    Console.WriteLine("Tipo: Moto");
                }
            }
        }
    }
}