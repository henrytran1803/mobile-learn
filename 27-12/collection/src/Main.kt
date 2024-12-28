//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
fun main() {
    val shapes: MutableList<String> = mutableListOf("triangle", "square", "circle")
    shapes.add("pentagon")
    println(shapes)
    val listOnlyRead = listOf("abc", "abcc")
// all collection have both property
    val mutableSet: MutableSet<String> = mutableSetOf("abc")
    val imutableSet = setOf("abc")
    val imutabledictionary = mapOf(1 to "a")
    val mutableDic : MutableMap<Int, String> = mutableMapOf(1 to "a")
    

}