import UIKit

var str = "Hello, playground"


var red, green, blue: Double?


print("\(2)", terminator:"test")


//当推断浮点数的类型时，Swift 总是会选择 Double 而不是Float。
let pi = 3.14159 // pi 会被推测为 Double 类型

//如果表达式中同时出现了整数和浮点数，会被推断为 Double 类型：
let anotherPi = 3 + 0.14159
// anotherPi 会被推测为 Double 类型



//控制流
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// 输出 "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// 输出 "4 < 42 < 100"


let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
