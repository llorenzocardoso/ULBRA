using ap2.Data;
using ap2.Data.Repositories;
using ap2.Domain.Entities;

var db = new DataContext();
var estacionamentoRepository = new EstacionamentoRepository(db);
var carroRepository = new CarroRepository(db);
var MotoRepository = new MotoRepository(db);

            
        Console.Clear();
        while (true)
        {
            Console.WriteLine("Selecione uma opção:");
            Console.WriteLine("1. Adicionar carro ao estacionamento");
            Console.WriteLine("2. Buscar veículo no estacionamento");
            Console.WriteLine("3. Listar vagas do estacionamento");
            Console.WriteLine("4. Remover veículo do estacionamento");
            Console.WriteLine("5. Sair");

            // Leia a opção selecionada pelo usuário
            string opcao = Console.ReadLine();

            switch (opcao)
            {
                    case "1":
                        AdicionarCarroAoEstacionamento();
                        break;
                    case "2":
                        BuscarVeiculoNoEstacionamento();
                        break;
                    case "3":
                        ListarVagasEstacionamento();
                        break;
                    case "4":
                        RemoverVeiculoEstacionamento();
                        break;
                    case "5":
                        Console.WriteLine("\nPrograma encerrado com sucesso!");
                        return;
                    default:
                        Console.WriteLine("Opção inválida. Tente novamente.");
                        break;
                }
            }

        void AdicionarCarroAoEstacionamento()
        {
            // Solicite as informações do carro ao usuário
            Console.WriteLine("Digite o ID do carro:");
            int id = int.Parse(Console.ReadLine());

            Console.WriteLine("Digite a placa do carro:");
            string placa = Console.ReadLine();

            Console.WriteLine("Digite o modelo do carro:");
            string modelo = Console.ReadLine();

            // Crie o objeto Carro com as informações fornecidas
            var carro = new Carro
            {
                Id = id,
                Placa = placa,
                Modelo = modelo
            };

            // Salve o carro no repositório de carros
            carroRepository.Save(carro);

            // Crie o objeto Vaga
            var vaga = new Estacionamento();

            // Salve a vaga no repositório de vagas
            estacionamentoRepository.Save(vaga);

            // Crie o objeto Estacionamento com as informações da vaga e do veículo
            var estacionamento = new Estacionamento
            {
                VagaId = vaga.Id
            };

            // Salve o estacionamento no repositório de estacionamentos
            estacionamentoRepository.Save(estacionamento);

            Console.WriteLine("Carro adicionado ao estacionamento com sucesso!");
        }

        void BuscarVeiculoNoEstacionamento()
        {
            Console.WriteLine("Digite o ID do veículo:");
            int id = int.Parse(Console.ReadLine());

            // Chame o método para buscar o veículo no estacionamento
            var estacionamento = estacionamentoRepository.BuscarId(id);

            if (estacionamento != null)
            {
                Console.WriteLine("Veículo encontrado:");
                Console.WriteLine($"Placa: {estacionamento.Veiculo.Placa}");
                Console.WriteLine($"Modelo: {estacionamento.Veiculo.Modelo}");
            }
            else
            {
                Console.WriteLine("Veículo não encontrado no estacionamento.");
            }
        }

        void ListarVagasEstacionamento()
        {
            // Chame o método para obter a lista de vagas do estacionamento
            var estacionamentos = estacionamentoRepository.GetAll();

            Console.WriteLine("Vagas do estacionamento:");

            foreach (var estacionamento in estacionamentos)  // Corrigido: usar a variável "estacionamentos" em vez de "Estacionamento"
            {
                Console.WriteLine($"ID da Vaga: {estacionamento.Id}");
                Console.WriteLine($"Placa do Veículo: {estacionamento.Veiculo.Placa}");
                Console.WriteLine($"Modelo do Veículo: {estacionamento.Veiculo.Modelo}");
                Console.WriteLine();
            }
        }

        void RemoverVeiculoEstacionamento()
        {
            Console.WriteLine("Digite o ID do veículo a ser removido:");
            int id = int.Parse(Console.ReadLine());

            // Chame o método para remover o veículo do estacionamento
            bool removido = estacionamentoRepository.Delete(id);

            if (removido)
            {
                Console.WriteLine("Veículo removido do estacionamento com sucesso!");
            }
            else
            {
                Console.WriteLine("Veículo não encontrado no estacionamento.");
            }
        }