//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

typealias UnsignedInteger = UInt32

let a : UnsignedInteger = 40

print("a=", a)

//Tuples
let http400Error = (400, "Bad Request")

http400Error.0
http400Error.1

let (requestStatusCode, requestStatusMessage) = http400Error
requestStatusCode
requestStatusMessage


//Optionals
var optionalString : String? = "A String literal"
optionalString = nil

optionalString = "An optional String"
print(optionalString!)

let nilName : String? = "gong" //nil
if let familyName = nilName {
//    let greetingfamilyName = "Hello, Mr.\(familyName)"
    print("Hello, Mr.\(familyName)")
} else {
    // Optional does not have a value
    print("Optional does not have a value")
}


//String

/*
 String is a struture and not a class. Structures are value types in Swift.
 therefore, any String is a value type and passed by values, not by references.
 */


let aVegetable = "Arugula"
var anEmptyString = ""  //EmptyString
var anotherEmptyString = String()

if anEmptyString.isEmpty {
    print("String is empty")
}


let string1 = "Hello"
let string2 = " Mr"

var welcome = string1 + string2

var instruction = "Follow us please"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)


//String interpolation
let multiplier = 3
let message = "\(multiplier) times 7.5 is \(Double(multiplier) * 7.5)"

//String comparison
let equal = string1 == string2
let prefix = string1.hasPrefix("He")
let suffix = string1.hasSuffix("lo")



//

//MARK: - Collections (arrays, dictionaries, sets)
/*
 in Swift, unlike Objective-C, all elements in a collection will have athe same type
 and we wiil nit be able to change the type of a collection after defining it.
 */


var cheeses = ["Brie", "Tete de Moine", "Cambozola", "Camembert"]
cheeses[2] = "Roqufort"
var cheeseWinePairs = [
    "Brie" : "Chardonnay",
    "Camembert" : "Champagne",
    "Gruyere" : "Sauvignon Blanc"
]

cheeseWinePairs["Cheddar"] = "Cabarnet Sauvignon"

let emptyArray = [String]()
let emptyDictionary = Dictionary<String,Float>()

let emptyTest = Array<String>()

cheeses = []
//cheeseWinePairs = [:]

// for loops
let scores = [65, 75, 92, 87, 68]
var teamScore = 0;

for score in scores {
    if score > 70 {
        teamScore = teamScore + 3
    } else {
        teamScore = teamScore + 1
    }
}


for (cheese, wine) in cheeseWinePairs {
    print("\(cheese):\(wine)")
}

var count = 0
for i in 0...3 {
    count += i
}
count

var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
repeat {
    m = m * 2
} while m < 100

m


// stride
let fourToTwo = Array(stride(from: 4, to: 1, by: -1)) //[4, 3, 2]
let fourToOne = Array(stride(from: 4, through: 1, by: -1)) //[4, 3, 2, 1]


//if
var theEmptyString = ""
if theEmptyString.isEmpty {
    print("An empty String")
} else {
    //String is not empty
}

//switch
/*
 unlike most other C-based programing languages,Swift does not need a bread statement for each case and supports any value types.
 switch statements can be used for range matching and where clauses in switch statements can be used to cheech additional conditions.
 */

let aNumber = "Four or Five"
var aResult : String
switch aNumber {
case "One" :
    aResult = "One"
case "Two", "Three":
    aResult = "Two or Three"
case let x where x.hasSuffix("Five"):
    aResult = "it is \(x)"
case let x where x.isEmpty == false:
    aResult = "test"

default:
    aResult = "Any other number"
}



// guard
func greet(person : [String : String]) {
    guard let name = person["name"] else {
        print("No no no ")
        return
    }
    print("Hello Ms \(name)!")
}

greet(person: ["what" : "what", "name" : "gong"])



//Functions

/*
 functions are self-contained blocks of code that perform a specific task
 In swift, they can be stored, passed, and returned.
 Functions in Swift can have multiple input parameters and multiple returns using tuples
 */


func greet1(name: String, day: String)->String {
    return "Hello \(name), today is \(day)"
}

greet1(name: "Ted", day: "Saturday")



//MARK: - Variadic Parameters

func sumOf(numbers: Int...)->(Int, Int, String) {
    var sum = 0
    var counter = 0
    for number in numbers {
        sum += number
        counter += 1
    }
    
    return (sum, counter, "Test")
    
}

let result_sum = sumOf(numbers: 7, 9, 15)
print(result_sum.0, result_sum.1, result_sum.2)



let cString  = "asdf"
//cString.count





func alignRight(string: String, count: Int, pad: Character) -> String{
    let amountToPad = count - string.count;
    if amountToPad < 1 {
        return string;
    }
    let padString = String(pad)
    var newString = string;
    for _ in 1...amountToPad {
        newString = padString + newString;
    }
    
    return newString;
}

let s1 = alignRight(string: "qwer", count: 4, pad: "D")
let s2 = alignRight(string: "q", count: 4, pad: "D")



// inout parameters
func swapTwoInts(a: inout Int, b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var aa = 1, bb = 2
swapTwoInts(a: &aa, b: &bb)
aa
bb

// nested functions
func returnTwenty()-> Int {
    var y = 10
    func add() {
        y += 10
    }
    add()
    return y
}

let twenty = returnTwenty()


// return other functions

func makeIncrementer()-> ((Int)-> Int) {
    func addOne(number: Int)-> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
let increment_x = increment(7)


//Closures

/*
 Closures are self-contained blocks of code that provide a specific functionality and can be stored, passed around, and used in the code.
 */

// As a variable:
var closureName:(Int)-> (Int)

// As a optional variable
var anotherClosureName:((Int)-> (Int))?

// As a tyoe alias:
typealias closureType = (Int)-> (Int)


// Map filter reduce  are higher-order functions


//map
//func map<U>(transform:(T)-> U)-> [U]
let numbers = [10, 30, 91, 50, 100, 39, 74]
var formattedNumbers: [String] = []
for number in numbers {
    let formattedNumber = "\(number)$"
    formattedNumbers.append(formattedNumber)
}

let formattedCount = formattedNumbers




















