using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula11_exercicios_interfaces{
    public class Program
    {
        static void Main(string[] args)
        {
            // Criação da lista de impressoras
            List<IImpressoraDeCodigoDeBarras> impressoras = new List<IImpressoraDeCodigoDeBarras>();
            impressoras.Add(new Elgin());
            impressoras.Add(new Zebra());

            // Solicitação do código de barras ao usuário
            Console.Write("Digite o código de barras do produto a ser impresso: ");
            string codigoDeBarras = Console.ReadLine();

            // Criação do objeto produto com base no código de barras informado pelo usuário
            Produto produto = new Produto
            {
                Id = 1, // Pode ser gerado dinamicamente em uma aplicação real
                CodigoDeBarras = codigoDeBarras,
                Preco = 10.99m // Pode ser obtido de uma fonte de dados em uma aplicação real
            };

            // Impressão da etiqueta em cada impressora
            foreach (IImpressoraDeCodigoDeBarras impressora in impressoras)
            {
                impressora.ImprimirEtiqueta(produto);
            }

            Console.ReadKey();
        }
    }
}