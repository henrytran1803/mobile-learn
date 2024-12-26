import UIKit

func cong() -> Int {
    print("Nhập số thứ nhất:")
    let num1 = Int(readLine() ?? "0") ?? 0
    print("Nhập số thứ hai:")
    let num2 = Int(readLine() ?? "0") ?? 0
    let result = num1 + num2
    print("Kết quả: \(result)")
    return result
}

func tru() -> Int {
    print("Nhập số thứ nhất:")
    let num1 = Int(readLine() ?? "0") ?? 0
    print("Nhập số thứ hai:")
    let num2 = Int(readLine() ?? "0") ?? 0
    let result = num1 - num2
    print("Kết quả: \(result)")
    return result
}

func nhan() -> Int {
    print("Nhập số thứ nhất:")
    let num1 = Int(readLine() ?? "0") ?? 0
    print("Nhập số thứ hai:")
    let num2 = Int(readLine() ?? "0") ?? 0
    let result = num1 * num2
    print("Kết quả: \(result)")
    return result
}

func chia() -> Double {
    print("Nhập số thứ nhất:")
    let num1 = Double(readLine() ?? "0") ?? 0
    print("Nhập số thứ hai:")
    let num2 = Double(readLine() ?? "0") ?? 1
    if num2 == 0 {
        print("Không thể chia cho 0")
        return 0.0
    }
    let result = num1 / num2
    print("Kết quả: \(result)")
    return result
}

print("Chào bạn")
while true {
    print("Mời bạn chọn phép tính: +, -, *, /, khác thì thoát")
    if let input = readLine() {
        switch input {
        case "+":
            cong()
        case "-":
            tru()
        case "*":
            nhan()
        case "/":
            chia()
        default:
            exit(0)
        }
    }
}
