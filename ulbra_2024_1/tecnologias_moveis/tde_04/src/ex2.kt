class Pessoa(val name: String, val age: Int){
    fun walk() {
        println("walking")
    }
    fun talk() {
        println("talking")
    }
}

fun main() {

    val pessoa = Pessoa("Lorenzo", 20)
    pessoa.walk()
    pessoa.talk()

}