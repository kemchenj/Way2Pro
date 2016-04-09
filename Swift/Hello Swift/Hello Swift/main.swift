//
//  main.swift
//  Hello Swift
//
//  Created by kemchenj on 4/8/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation

print("Hello, World!")

var i = 33;
var str = "hello world"
print(str)

let const:Double = 23
print(const)

let test = str + String(const)
// 非字符类型要做字符转换才能用
print(test)


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

print(appleSummary)
print(fruitSummary)


var shoppingList = ["catfish", "water", "tulips", "blue paint"]
print(shoppingList[1])
shoppingList[1] = "bottle of water"
print(shoppingList[1])

