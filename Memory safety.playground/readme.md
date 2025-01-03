# Memory Safety trong Swift

### 1. Xung đột truy cập bộ nhớ:
```swift
// Lỗi memory access conflict
var stepSize = 1
func increment(_ number: inout Int) { 
    number += stepSize // Truy cập stepSize và number cùng lúc
}
increment(&stepSize) // Lỗi
```

### 2. Giải pháp:
```swift
// Cách 1: Dùng biến local
func incrementFixed(_ number: inout Int) {
    let temp = stepSize
    number += temp 
}

// Cách 2: Tham số riêng biệt
func incrementBetter(number: inout Int, step: Int) {
    number += step
}
```

### 3. Collections:
```swift
var players = ["Alice", "Bob"]
let playerNumber = players.count
players[playerNumber] // Lỗi: out of bounds access

// An toàn:
if playerNumber < players.count {
    players[playerNumber]
}
```

### 4. Property access:
```swift
class Account {
    var balance: Int
    let withdraw: (Int) -> Void

    init(initialBalance: Int) {
        balance = initialBalance
        withdraw = { [weak self] amount in
            self?.balance -= amount // Safe access
        }
    }
}
```

Key rules:
- Không truy cập cùng địa chỉ bộ nhớ đồng thời
- Kiểm tra bounds trước khi truy cập array
- Dùng weak/unowned cho closures
- Tránh mutating trong đa luồng