```swift
// 1. Tính kế thừa (Inheritance)
class Animal {
    var name: String
    init(name: String) { self.name = name }
    func makeSound() { print("...") }
}

class Dog: Animal {
    override func makeSound() { print("Woof") }
}

// 2. Tính đóng gói (Encapsulation) 
class BankAccount {
    private var balance: Double
    public func deposit(amount: Double) {
        balance += amount
    }
}

// 3. Tính đa hình (Polymorphism)
protocol Vehicle {
    func start()
}

class Car: Vehicle {
    func start() { print("Car starting") }
}

class Bike: Vehicle { 
    func start() { print("Bike starting") }
}

// 4. Tính trừu tượng (Abstraction)
protocol DatabaseService {
    func connect()
    func query() 
}

class MySQLDatabase: DatabaseService {
    func connect() { print("MySQL connected") }
    func query() { print("MySQL query") }
}
```

Key points:
- Kế thừa: override methods
- Đóng gói: private/public access
- Đa hình: protocol implementation 
- Trừu tượng: protocol definition