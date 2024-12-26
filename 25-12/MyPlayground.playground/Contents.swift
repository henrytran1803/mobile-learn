import UIKit

if true {
    print("do")
}
var a = true
var b = false
if a {
    print("do a")
}else if b {
    print("do b")
}
else{
    print("do c")
}
// phép gán if else nhanh

var c = a ? "do a": "do b"

for i in 0...10 {
    print(i)
}
// 0 to 10
for i in 0..<10 {
    print(i)
}
// 0 to <= 10
var i = 10
while (i > 0 ){
    print(i)
    i -= 1
}
 i = 10
repeat{
    print(i)
    i -= 1
}while(i > 0 )


let value = 3
switch value {
case 0:
    print("Zero")
case 1...5:
    print("Between 1 and 5")
default:
    print("Other value")
}
for i in stride(from: 0, to: 10, by: 2) {
    print(i) // 0, 2, 4, 6, 8
}

for i in stride(from: 10, through: 0, by: -2) {
    print(i) // 10, 8, 6, 4, 2, 0
}
