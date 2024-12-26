fun cong(): Int {
    println("Nhập số thứ nhất:")
    val num1 = readLine()?.toIntOrNull() ?: 0
    println("Nhập số thứ hai:")
    val num2 = readLine()?.toIntOrNull() ?: 0
    val result = num1 + num2
    println("Kết quả: $result")
    return result
}

fun tru(): Int {
    println("Nhập số thứ nhất:")
    val num1 = readLine()?.toIntOrNull() ?: 0
    println("Nhập số thứ hai:")
    val num2 = readLine()?.toIntOrNull() ?: 0
    val result = num1 - num2
    println("Kết quả: $result")
    return result
}

fun nhan(): Int {
    println("Nhập số thứ nhất:")
    val num1 = readLine()?.toIntOrNull() ?: 0
    println("Nhập số thứ hai:")
    val num2 = readLine()?.toIntOrNull() ?: 0
    val result = num1 * num2
    println("Kết quả: $result")
    return result
}

fun chia(): Double {
    println("Nhập số thứ nhất:")
    val num1 = readLine()?.toDoubleOrNull() ?: 0.0
    println("Nhập số thứ hai:")
    val num2 = readLine()?.toDoubleOrNull() ?: 1.0
    if (num2 == 0.0) {
        println("Không thể chia cho 0")
        return 0.0
    }
    val result = num1 / num2
    println("Kết quả: $result")
    return result
}

fun main() {
    println("Chào bạn")
    while (true) {
        println("Mời bạn chọn phép tính: +, -, *, /, khác thì thoát")
        val a = readLine()
        when(a) {
            "+" -> cong()
            "-" -> tru()
            "*" -> nhan()
            "/" -> chia()
            else -> break
        }
    }
}