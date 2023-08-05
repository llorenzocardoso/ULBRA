using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace aula11_exercicios_interfaces
{
    public interface IImpressoraDeCodigoDeBarras
    {
        void ImprimirEtiqueta(Produto produto);
    }
}