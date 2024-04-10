fun main() {

    val pessoa1 = Person(name = "lorenzo", age = 20, profession = "desempregado", cpf = "000.000.000-00")
    println(pessoa1)

    val pessoa2 = pessoa1.copy(name = "lorenzo da cunha cardoso")
    println(pessoa2)

}

data class Person(val name: String, val age: Int, val profession: String, val cpf: String)