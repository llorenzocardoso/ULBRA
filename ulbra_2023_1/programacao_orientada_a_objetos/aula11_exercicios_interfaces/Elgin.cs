using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula11_exercicios_interfaces
{
    public class Elgin : IImpressoraDeCodigoDeBarras
    {
        public void ImprimirEtiqueta(Produto produto)
        {
            // Simulação da impressão de etiqueta na impressora Elgin
            Console.WriteLine($"Imprimindo etiqueta na impressora Elgin para o produto: {produto.Id} - {produto.CodigoDeBarras} - R${produto.Preco}");
            Console.WriteLine("Configurações padrão: Resolução 300dpi, tamanho 10cm x 5cm, tipo de etiqueta: papel adesivo.");
            Console.WriteLine("Etiqueta impressa com sucesso!\n");
        }
    }
}