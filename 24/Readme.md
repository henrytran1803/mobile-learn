# Kotlin vs Swift Basic - Day 1

## 1. Variables & Constants

### Swift
```swift
// Variable (Mutable)
var name = "John"
var age: Int = 25

// Constant (Immutable) 
let maxScore = 100
let pi: Double = 3.14
```

### Kotlin
```kotlin
// Variable (Mutable)
var name = "John"  
var age: Int = 25

// Constant (Immutable)
val maxScore = 100
val pi: Double = 3.14
```

## 2. Collections

### Swift
```swift
// Array
var fruits = ["Apple", "Orange"]
var numbers: [Int] = [1, 2, 3]

// Set
var uniqueNumbers: Set = [1, 2, 3]

// Dictionary
var scores = ["John": 100, "Mary": 95]

// Tuple
let person = (name: "John", age: 25)
```

### Kotlin
```kotlin
// List
val fruits = listOf("Apple", "Orange") 
val mutableFruits = mutableListOf("Apple", "Orange")

// Set
val uniqueNumbers = setOf(1, 2, 3)
val mutableNumbers = mutableSetOf(1, 2, 3)

// Map (Dictionary)
val scores = mapOf("John" to 100, "Mary" to 95)
val mutableScores = mutableMapOf("John" to 100)

// No direct tuple support, use data class instead
data class Person(val name: String, val age: Int)
```

## Key Differences

1. Constants:
   - Swift: `let`
   - Kotlin: `val`

2. Collections:
   - Swift: Mutable by default
   - Kotlin: Immutable by default, needs `mutable` prefix

3. Tuple:
   - Swift: Built-in support
   - Kotlin: Uses data classes instead

4. Type Inference:
   - Both support type inference
   - Optional explicit type declaration