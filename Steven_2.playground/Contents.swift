//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


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
let mappedNumbers = numbers.map{"\($0)$"}
let testNumbers = [["name" : "this is name"], ["age" : "this is age"]]
let testMap = testNumbers.map { (dict : [String : String]) -> [String : String] in
    var newDict = [String : String]()
    for key in dict.keys {
        var value = dict[key]
        value = key + " " + value!
        newDict[key] = value
    }
    return newDict
}
let ggMap = testNumbers.map{$0.values.map{$0 + "  gg"}}
print(ggMap)

let ttMap = numbers.map({number in number * 3})
print(ttMap)

let tMap = numbers.sorted{$0 > $1}
print(tMap)





//filter  returns Bool indicating whether the element should be included in the resulting array

//return an Array containing the elements x of self for which includeElement(x) is ture



let someEventNumbers = numbers.filter{
    $0 % 2 == 0
}

let testEventNumbers = numbers.filter { (number) -> Bool in
    number % 2 == 0
}

print(someEventNumbers)
print(testEventNumbers)



//Reduce
let nums = [1, 2, 3, 4]
let total = nums.reduce(3){$0 + $1}
print(total)

let testTotal = nums.reduce(2) { (sum, n) -> Int in
    
    return sum + n
}
print(testTotal)

let testTotal_2 = [1, 2, 3].reduce(0, +)
print(testTotal_2)

// Enumeration
enum MLSTeam {
    case montreal
    case toronto
    case newYork
    case columbus
    case losAngeles
    case seattle
}

let theTeam = MLSTeam.montreal

switch theTeam {
case .montreal:
    print("Monreal Impact")
case .toronto:
    print("Toronto FC")
case .newYork, .columbus, .losAngeles, .seattle :
    print("else")
}




