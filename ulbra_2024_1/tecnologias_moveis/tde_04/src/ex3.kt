fun main() {
    // Uma chamada em alguma API
    val result: Resultado = Resultado.Successo(data = "dadosEmJson")

    when(result) {
        Resultado.Error -> println("Error")
        Resultado.Loading -> println("Mostrar uma tela de loading")
        is Resultado.Successo -> println(result.data)
    }

}

sealed class Resultado {
    data object Loading : Resultado()
    data object Error: Resultado()
    data class Successo(val data: String) : Resultado()
}
