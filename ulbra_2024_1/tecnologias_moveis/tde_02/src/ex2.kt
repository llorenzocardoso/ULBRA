fun main() {
    val listNumbers : List<Int> = listOf(2,4,5,6,7,8,10)
    val result = pairNumbers(listNumbers)

    println(result)
}

fun pairNumbers(listNumbers : List<Int>) =
    if (listNumbers.isNotEmpty()) listNumbers.filter {it % 2 == 0} else listOf(0)
