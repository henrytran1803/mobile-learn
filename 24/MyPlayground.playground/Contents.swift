import UIKit

var greeting = "Hello, playground"
let gret = "hello"
print(greeting)
// type swift
var welcomeMessage: String
welcomeMessage = "Hello"
var red, green, blue: Double
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
// unit8,12,32,64 bội của 2
// tuple

let http404Error = (404, "Not Found")
let possibleNumber = "100"
let myNumber = Int(possibleNumber)
// Here, myNumber is an optional integer
if let myNumber = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber)")
}
// Prints "My number is 123"
//? là optional ! là ép kiểu thành un optional
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // Requires explicit unwrapping


let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // Unwrapped automatically
