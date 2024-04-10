fun main() {
    // NOVO OBJETO
    val meuObjeto = CharGenerator(min = 'A', max = 'z')
    println(meuObjeto.generateChar())
}

data class CharGenerator(val min: Char, val max: Char) {


    // Inferencia de tipo
    // Range
    fun generateChar() = (min..max).random()

}