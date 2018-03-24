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





