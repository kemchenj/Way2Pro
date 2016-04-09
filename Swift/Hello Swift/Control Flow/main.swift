//
//  main.swift
//  Control Flow
//
//  Created by kemchenj on 4/9/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 { // 这里必须是布尔表达式, 整数不能作为表达式
        //if score { 会报错
        teamScore += 3
    } else{
        teamScore += 1
    }
}
print(teamScore)


var optionalString : String? = "Hello"
print(optionalString == nil)

var optionalName : String? = "John Appleseed"
// 这里的?的意识是不确定类型
var greeting = "Hello"

// optionalName = nil
// 这里是对optionalName是否是nil的检查
if let name = optionalName {
    greeting = "Hello, \(name)"
    print(greeting)
}


// let nickname : String? = "kem"
let nickname : String? = nil
let fullname : String? = nil
let fllname : String? = "John Appleseed"
let informalGreetring = "Hi \(nickname ?? fullname ?? fllname)"
// ??表示是optional的, 如果前面的值为nil的话, 就用后面的值
print(informalGreetring);


let vegetable = "red pepper"
// switch的case不受类型限制, 而且不用写break
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    
    case "cucumber", "watercress": // case可以有多个值, 类似于||
        print("That would make a good tea sandwich.")
    
    case let x where x.hasSuffix("pepper"):
        // 这里的把where指代的vegetable赋值给x, 然后判断x是否拥有pepper猴嘴
        print("Is it a spicy \(x)?")
        print(x)
    
    default:
        print("Everything tastes good in soup.")
}


let interestingNumber = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind : String?
for (kind, numbers) in interestingNumber{
    for number in numbers{
        if number > largest{
            largest = number
            largestKind = kind
        }
    }
}
print("largest number \(largest) is in \(largestKind)")




var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
}while m < 100
print(m)

var total = 0
for i in 3..<9{
    total += i;
}
print(total)



