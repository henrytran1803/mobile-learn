# Swift Programming Concepts

### 1. Memory Management
- ARC (Automatic Reference Counting)
- Strong References
- Weak References
- Unowned References
- Memory Safety
- Deinitialization
```swift
// 1. ARC & Strong References
class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) init")
    }
    
    deinit { print("\(name) deinit") }
}

class Apartment {
    let unit: String
    var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
        print("Apt \(unit) init")
    }
    
    deinit { print("Apt \(unit) deinit") }
}

// 2. Weak References
class Teacher {
    let name: String
    weak var classroom: Classroom?
    
    init(name: String) {
        self.name = name
    }
}

class Classroom {
    let number: String
    var teacher: Teacher?
}

// 3. Unowned References  
class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) { self.name = name }
}

class CreditCard {
    let number: Int
    unowned let customer: Customer
    
    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
}

// 4. Memory Safety
func swap<T>(_ a: inout T, _ b: inout T) {
    let temp = a 
    a = b
    b = temp
}

// Test
var john: Person? = Person(name: "John")
var apt4A: Apartment? = Apartment(unit: "4A")

// Strong reference cycle
john?.apartment = apt4A
apt4A?.tenant = john

// Break cycle
john = nil
apt4A = nil
```

Kết quả:
- Không giải phóng khi strong reference cycle
- weak/unowned giúp tránh cycle
- Memory safety với inout parameters
- Tracking memory với deinit
### 2. Object-Oriented Programming
- Classes & Structs
- Inheritance
- Encapsulation
- Polymorphism
- Access Control
- Properties & Methods
- Protocol & Protocol Extensions
- Initialization
```swift
// 1. Classes & Structs, Inheritance
class Animal {
    var name: String
    init(name: String) { self.name = name }
    
    func makeSound() { print("...") }
}

class Dog: Animal {
    var breed: String
    
    init(name: String, breed: String) {
        self.breed = breed
        super.init(name: name)
    }
    
    override func makeSound() { print("Woof") }
}

// 2. Encapsulation & Access Control
class BankAccount {
    private var balance: Double = 0
    
    public func deposit(amount: Double) {
        balance += amount
    }
    
    private func validate(_ amount: Double) -> Bool {
        return amount > 0 && amount <= balance
    }
}

// 3. Polymorphism with Protocol
protocol Vehicle {
    var brand: String { get }
    func start()
}

class Car: Vehicle {
    var brand: String
    init(brand: String) { self.brand = brand }
    func start() { print("Car starting") }
}

class Bike: Vehicle {
    var brand: String
    init(brand: String) { self.brand = brand }
    func start() { print("Bike starting") }
}

// 4. Protocol Extension
protocol Flyable {
    func fly()
}

extension Flyable {
    func fly() { print("Flying...") }
}

// 5. Properties
class Temperature {
    // Stored property
    var celsius: Double = 0
    
    // Computed property
    var fahrenheit: Double {
        get { celsius * 9/5 + 32 }
        set { celsius = (newValue - 32) * 5/9 }
    }
    
    // Property observer
    var steps: Int = 0 {
        willSet { print("Will set: \(newValue)") }
        didSet { print("Did set from: \(oldValue)") }
    }
}

// Usage
let dog = Dog(name: "Rex", breed: "German Shepherd")
dog.makeSound() // "Woof"

let vehicles: [Vehicle] = [Car(brand: "Toyota"), Bike(brand: "Giant")]
vehicles.forEach { $0.start() }
```

Key points:
- Inheritance với override
- Private/Public access control 
- Protocol định nghĩa interface
- Extension thêm functionality
- Properties: stored, computed, observers
### 3. Functional Programming
- Higher Order Functions
- Map, Filter, Reduce
- Closures
- Pure Functions
- Function Types
- Function Builders
```swift
// 1. Higher Order Functions & Closures
let numbers = [1, 2, 3, 4, 5]

// Map
let doubled = numbers.map { $0 * 2 }

// Filter
let evens = numbers.filter { $0 % 2 == 0 }

// Reduce
let sum = numbers.reduce(0, +)
let concat = ["a", "b", "c"].reduce("") { $0 + $1 }

// 2. Function Types
typealias Operation = (Int, Int) -> Int

let add: Operation = { $0 + $1 }
let multiply: Operation = { $0 * $1 }

func calculate(_ op: Operation, _ x: Int, _ y: Int) -> Int {
    return op(x, y)
}

// 3. Pure Functions
struct Math {
    static func square(_ x: Int) -> Int {
        return x * x  // No side effects
    }
}

// 4. Function Builders
@resultBuilder
struct ArrayBuilder {
    static func buildBlock<T>(_ components: T...) -> [T] {
        components
    }
}

@ArrayBuilder
func makeArray() -> [Int] {
    1
    2
    3
}

// 5. Chaining Functions
let result = numbers
    .filter { $0 % 2 == 0 }
    .map { $0 * 2 }
    .reduce(0, +)

// 6. Closure Capture
func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}

let counter = makeCounter()
print(counter()) // 1
print(counter()) // 2
```
### 4. Type System
- Generics
- Associated Types
- Type Aliases
- Opaque Types
- Phantom Types
- Value vs Reference Types
- Type Erasure
```swift
// 1. Generics
func swap<T>(_ a: inout T, _ b: inout T) {
    let temp = a; a = b; b = temp
}

// 2. Associated Types
protocol Container {
    associatedtype Item
    var items: [Item] { get set }
    mutating func add(_ item: Item)
}

struct Stack<T>: Container {
    typealias Item = T
    var items: [T] = []
    mutating func add(_ item: T) { items.append(item) }
}

// 3. Type Aliases
typealias StringDictionary = Dictionary<String, String>
typealias Coordinate = (x: Int, y: Int)

// 4. Opaque Types
protocol Shape { 
    func draw() 
}
struct Square: Shape {
    func draw() { print("□") }
}
func makeShape() -> some Shape { Square() }

// 5. Phantom Types
enum Verified {}
enum Unverified {}
struct Email<Status> {
    let value: String
}

// 6. Value vs Reference Types
struct Point { // Value type
    var x, y: Int
}
class Person { // Reference type
    var name: String
    init(name: String) { self.name = name }
}

// 7. Type Erasure
protocol Animal { func makeSound() }
struct AnyAnimal: Animal {
    private let _makeSound: () -> Void
    
    init<A: Animal>(_ animal: A) {
        _makeSound = animal.makeSound
    }
    
    func makeSound() {
        _makeSound()
    }
}
```
### 5. Concurrency
- Async/Await
- Actors
- GCD
- Operations
- Threading
- TaskGroup
```swift
// 1. Async/Await
func fetchData() async throws -> Data {
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

// Calling async function
Task {
    do {
        let data = try await fetchData()
    } catch { }
}

// 2. Actors
actor BankAccount {
    private var balance = 0
    func deposit(_ amount: Int) {
        balance += amount
    }
    func withdraw(_ amount: Int) -> Bool {
        guard balance >= amount else { return false }
        balance -= amount
        return true
    }
}

// 3. GCD (Grand Central Dispatch)
DispatchQueue.main.async {
    // UI updates
}

DispatchQueue.global().async {
    // Background work
}

// 4. Operations
let queue = OperationQueue()
let operation = BlockOperation {
    // Complex task
}
queue.addOperation(operation)

// 5. Threading
let thread = Thread {
    print("Running in new thread")
}
thread.start()

// 6. TaskGroup
func processImages() async throws {
    try await withThrowingTaskGroup(of: Image.self) { group in
        for id in imageIDs {
            group.addTask {
                return try await downloadImage(id)
            }
        }
    }
}
```

Key concepts:
- async/await for modern concurrency
- actors for thread-safe state
- GCD for queue management 
- Operations for complex tasks
- TaskGroup for parallel processing
### 6. Error Handling
- Try-Catch
- Result Type
- Optional
- Throws
- Error Protocol
- Defer
```swift
// 1. Error Protocol & Try-Catch
enum NetworkError: Error {
    case noConnection
    case invalidData
}

func fetchData() throws -> Data {
    throw NetworkError.noConnection
}

do {
    let data = try fetchData()
} catch NetworkError.noConnection {
    print("No connection")
} catch {
    print("Other error: \(error)")
}

// 2. Result Type
func divide(_ x: Int, by y: Int) -> Result<Int, Error> {
    guard y != 0 else {
        return .failure(NSError(domain: "", code: -1))
    }
    return .success(x / y)
}

// 3. Optional
var name: String? = "John"
if let unwrapped = name {
    print(unwrapped)
}

// 4. Throws with Functions
func process() throws {
    defer { print("Always executes") }
    guard someCondition else {
        throw NetworkError.invalidData
    }
}

// 5. Optional Try
if let result = try? fetchData() {
    // Use result
}

let forced = try! fetchData() // Dangerous!
```

Key notes:
- `Error` protocol for custom errors
- `Result` type for expressing success/failure
- `try`, `try?`, `try!` variations
- `defer` for cleanup code
- Optionals for nil handling
### 7. Property Features
- Computed Properties
- Property Observers
- Property Wrappers
- Lazy Properties 
- KVO & KVC
- Key Path
```swift
// 1. Computed Properties
struct Circle {
    var radius: Double
    var area: Double {
        get { .pi * radius * radius }
        set { radius = sqrt(newValue / .pi) }
    }
}

// 2. Property Observers
var steps: Int = 0 {
    willSet { print("About to set: \(newValue)") }
    didSet { print("Changed from: \(oldValue)") }
}

// 3. Property Wrappers
@propertyWrapper
struct Clamped {
    private var value: Int
    private let range: ClosedRange<Int>
    
    var wrappedValue: Int {
        get { value }
        set { value = min(max(range.lowerBound, newValue), range.upperBound) }
    }
    
    init(wrappedValue: Int, range: ClosedRange<Int>) {
        self.range = range
        self.value = min(max(range.lowerBound, wrappedValue), range.upperBound)
    }
}

// 4. Lazy Properties
class DataManager {
    lazy var expensiveData: [String] = {
        // Heavy computation
        return loadData()
    }()
}

// 5. KeyPath
struct User {
    let name: String
    let age: Int
}

let nameKeyPath = \User.name
let user = User(name: "John", age: 30)
print(user[keyPath: nameKeyPath])
```
### 8. Design Patterns
- Singleton
- Delegate
- Observer
- Factory
- Builder
- Dependency Injection
- MVVM/MVC
```swift
// 1. Singleton
class DataManager {
    static let shared = DataManager()
    private init() {}
}

// 2. Delegate
protocol ShoppingCartDelegate: AnyObject {
    func cartDidUpdate(total: Double)
}

class ShoppingCart {
    weak var delegate: ShoppingCartDelegate?
    
    func addItem() {
        delegate?.cartDidUpdate(total: 100)
    }
}

// 3. Observer (Using Combine)
class UserViewModel {
    @Published var name: String = ""
}

// 4. Factory
protocol Animal { func makeSound() }

class AnimalFactory {
    static func createAnimal(type: String) -> Animal {
        switch type {
        case "dog": return Dog()
        case "cat": return Cat()
        default: fatalError()
        }
    }
}

// 5. Builder
class URLBuilder {
    private var components: URLComponents
    
    init() { components = URLComponents() }
    
    func setScheme(_ scheme: String) -> URLBuilder {
        components.scheme = scheme
        return self
    }
    
    func build() -> URL? { components.url }
}

// 6. MVVM
struct User { let name: String }

class UserViewModel {
    private let user: User
    var displayName: String { user.name.capitalized }
    
    init(user: User) { self.user = user }
}

// 7. Dependency Injection
protocol NetworkService {
    func fetch() async throws -> Data
}

class ProductViewModel {
    private let network: NetworkService
    init(network: NetworkService) {
        self.network = network
    }
}
```
### 9. Protocol-Oriented
- Protocol Composition
- Protocol Extensions
- Conditional Conformance
- Associated Types
- Default Implementations
```swift
// 1. Protocol Composition
protocol Payable { var salary: Double { get } }
protocol Employee { var id: String { get } }
func hire(_ person: Payable & Employee) { }

// 2. Protocol Extensions
protocol Numeric {
    var value: Int { get }
}
extension Numeric {
    func double() -> Int { value * 2 }
}

// 3. Conditional Conformance
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        map { $0.textualDescription }.joined(separator: ", ")
    }
}

// 4. Associated Types
protocol Container {
    associatedtype Item
    var items: [Item] { get set }
    mutating func add(_ item: Item)
}

// 5. Default Implementation
protocol Animal {
    func eat()
}
extension Animal {
    func sleep() { print("Sleeping...") }
    func eat() { print("Eating...") }
}

// Example usage
struct Dog: Animal {
    // Uses default eat() implementation
    // Can override if needed
}
```
### 10. Data Management
- Codable
- PropertyList
- UserDefaults
- FileManager
- Core Data
- JSON Parsing
```swift
// 1. Codable
struct User: Codable {
    let id: Int
    let name: String
}

// Encoding/Decoding
let encoder = JSONEncoder()
let decoder = JSONDecoder()

// 2. PropertyList
let plist: [String: Any] = [
    "name": "John",
    "age": 30,
    "scores": [85, 90, 95]
]

// 3. UserDefaults
class Settings {
    static let defaults = UserDefaults.standard
    
    static var username: String {
        get { defaults.string(forKey: "username") ?? "" }
        set { defaults.set(newValue, forKey: "username") }
    }
}

// 4. FileManager
let fileManager = FileManager.default
let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!

func saveData(_ data: Data, to filename: String) throws {
    let fileURL = documentsPath.appendingPathComponent(filename)
    try data.write(to: fileURL)
}

// 5. JSON Parsing
func parseJSON() throws {
    let json = """
    {
        "name": "John",
        "age": 30
    }
    """.data(using: .utf8)!
    
    let user = try JSONDecoder().decode(User.self, from: json)
}

// 6. Core Data
class CoreDataManager {
    static let shared = CoreDataManager()
    var persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
```