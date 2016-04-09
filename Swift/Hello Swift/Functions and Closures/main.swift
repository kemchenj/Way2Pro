//
//  main.swift
//  Functions and Closures
//
//  Created by kemchenj on 4/9/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation

func greet(name: String, day: String)->String{
    return "Hello \(name), today is \(day)"
}
print(greet("bob", day: "Sunday"))


func calculationStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    // 输入一个scores的int数组
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores{
        if score > max{
            max = score
        } else if score < min{
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculationStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)
// 多返回值可以通过下标访问


func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
print(sumOf())
print(sumOf(123, 874, 34))

//func averageOf(numbers: Int...) -> Int{
//    var average = 0
//    var sum = 0
//    for number in numbers{
//        sum += number
//    }
//    
//    average = sum / argc
//}
//print(averageOf(2, 4, 9))


func returnFifteen() -> Int {
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}
print(returnFifteen())


func makeIncrementer() -> ((Int)->(Int)) {
    func addOne(number: Int) -> Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))

// 函数式语言的特点, 函数也是一等公民, 可以作为一种数据类型里看待
func hasAnyMatches(list: [Int], condition:(Int)->(Bool)) ->(Bool) {
    for item in list{
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number<10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(numbers, condition: lessThanTen))


// map是从基类继承过来的方法, 会返回一个array包括了return回来的结果
print(numbers.map({
    (number: Int) -> Int in // self
    let result = 3 * number
    return result
}))

print(numbers.map({
    (number: Int) -> Int in // self
    let result = 3 * number
    return result
}))