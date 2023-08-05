using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula11_exercicios_interfaces
{
    public class Zebra : IImpressoraDeCodigoDeBarras
    {
        public void ImprimirEtiqueta(Produto produto)
        {
            // Simulação da impressão de etiqueta na impressora Zebra
            Console.WriteLine($"Imprimindo etiqueta na impressora Zebra para o produto: {produto.Id} - {produto.CodigoDeBarras} - R${produto.Preco}");
            Console.WriteLine("Configurações padrão: Resolução 600dpi, tamanho 15cm x 7cm, tipo de etiqueta: poliéster ");
            Console.WriteLine("Etiqueta impressa com sucesso!\n");
        }
    }
}