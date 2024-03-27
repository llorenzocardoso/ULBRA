import java.util.*

fun main() {
    val listString : List<String> = listOf("test 1", "test 2")
    val result = stringToUppercase(listString)

    println(result)
}

fun stringToUppercase(listString : List<String>) =
    if (listString.isNotEmpty()) listString.map { it.toUpperCase() } else listOf("empty list!")