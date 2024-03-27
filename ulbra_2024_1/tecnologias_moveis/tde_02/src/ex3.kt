fun main() {
    val listNumbers : List<Int> = listOf(2,4,5,6,5,7,5,5,5,5,5,8,10)
    val result = duplicateNumbers(listNumbers)

    println(result)
}

fun duplicateNumbers(listNumbers : List<Int>) =
    if (listNumbers.isNotEmpty()) listNumbers.distinct() else listOf(0)