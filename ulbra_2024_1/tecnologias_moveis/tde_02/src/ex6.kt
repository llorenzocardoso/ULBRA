import java.util.*

fun main() {
    val stringTest = "test"
    val result = stringTest.stringToUpper()

    println(result)
}

fun String.stringToUpper() = this.uppercase(Locale.getDefault())