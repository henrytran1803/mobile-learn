class BankAccount {
    // Private properties - chỉ truy cập được trong class
    private var balance: Double
    private var accountNumber: String
    
    // Public interface
    public var accountHolder: String
    
    // Getter để đọc số dư an toàn
    public var currentBalance: Double {
        get { return balance }
    }
    
    init(holder: String, initialBalance: Double) {
        self.accountHolder = holder
        self.balance = initialBalance
        self.accountNumber = UUID().uuidString
    }
    
    // Public methods
    public func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
        }
    }
    
    public func withdraw(amount: Double) -> Bool {
        if amount > 0 && balance >= amount {
            balance -= amount
            return true
        }
        return false
    }
}
// Base class
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Some sound")
    }
}

// Inherited class
class Dog: Animal {
    var breed: String
    
    init(name: String, breed: String) {
        self.breed = breed
        super.init(name: name)
    }
    
    // Override method
    override func makeSound() {
        print("Woof!")
    }
}

// Inherited class khác
class Cat: Animal {
    var color: String
    
    init(name: String, color: String) {
        self.color = color
        super.init(name: name)
    }
    
    override func makeSound() {
        print("Meow!")
    }
}
// Protocol định nghĩa interface
protocol Shape {
    func area() -> Double
    func perimeter() -> Double
}

// Các class implement protocol
class Circle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    func perimeter() -> Double {
        return 2 * Double.pi * radius
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func area() -> Double {
        return width * height
    }
    
    func perimeter() -> Double {
        return 2 * (width + height)
    }
}

// Sử dụng tính đa hình
func printArea(shape: Shape) {
    print("Diện tích: \(shape.area())")
}
// Protocol trừu tượng
protocol Vehicle {
    var currentSpeed: Double { get }
    func start()
    func stop()
    func accelerate(by: Double)
}

// Class concrete implement protocol
class Car: Vehicle {
    private var engine: Engine
    private var speed: Double = 0
    
    var currentSpeed: Double {
        return speed
    }
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    func start() {
        engine.turnOn()
    }
    
    func stop() {
        engine.turnOff()
        speed = 0
    }
    
    func accelerate(by amount: Double) {
        if engine.isRunning {
            speed += amount
        }
    }
}
// Sử dụng
let account = BankAccount(holder: "Nguyen Van A", initialBalance: 1000000)
account.deposit(amount: 500000)
account.withdraw(amount: 200000)

let dog = Dog(name: "Lu", breed: "Husky")
dog.makeSound()  // "Woof!"

let cat = Cat(name: "Miu", color: "White")
cat.makeSound()  // "Meow!"

let circle = Circle(radius: 5)
let rectangle = Rectangle(width: 4, height: 6)

printArea(shape: circle)     // Đa hình
printArea(shape: rectangle)  // Đa hình

let car = Car(engine: Engine())
car.start()
car.accelerate(by: 50)
print(car.currentSpeed)