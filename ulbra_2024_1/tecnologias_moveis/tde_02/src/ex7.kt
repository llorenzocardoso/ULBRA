fun main(){

    val number = 150
    val result = number.numberToBrl()

    println(result)

}

fun Int.numberToBrl() = "R$ $this"