fun main() {
    val listNumbers : List<Int> = listOf(1,2,3,4,5)
    val result = averageCalculator(listNumbers)

    println(result)
}

fun averageCalculator(listNumbers: List<Int>) =
    if(listNumbers.isNotEmpty()) listNumbers.average() else 0.0