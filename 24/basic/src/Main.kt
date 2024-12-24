
fun BMICalculator() {
    println("Nhập lần lượt chiều cao và cân nặng")
    val height = readLine()?.toDoubleOrNull() ?: 0.0
    val weight = readLine()?.toDoubleOrNull() ?: 0.0
    val bmi = weight / (height * height)
    println("BMI của bạn là $bmi")
    if (bmi < 18.5) {
        println("Gầy")
    }else if (bmi < 25 ) {
        println("vừa")
    }else {
        println("thừa cân")
    }
}
fun main() {
    BMICalculator()
}