fun main() {
    val listNumbers : List<Int> = listOf(2,4,5,6,7,8,10)
    val result = lastOdd(listNumbers)

    println(result)
}

fun lastOdd(listNumbers : List<Int>) =
    if (listNumbers.isNotEmpty()) listNumbers.lastOrNull(){ it % 2 != 0 } else 0