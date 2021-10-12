//
//  main.swift
//  SwiftHw3
//
//  Created by aprirez on 10/11/21.
//

import Foundation

func inputNumber(_ prompt: String, _ validator: (Int) -> Bool) -> Int {
    repeat {
        print(prompt)
        if let input = readLine(),
           let value = Int(input)
        {
            if (!validator(value)) { continue }
            print("The number is: ", value)
            return value
        }
        print("The input is not a number")
    } while true
}

let start = inputNumber("Input start number: ") { _ in true }
let end = inputNumber("Input end number > start number: ") { $0 >= start }
let divider =
    inputNumber(
        "Input N, the number should be in range start <= N <= end: "
    ) { $0 >= start && $0 <= end }

func printCount(start: Int, end: Int, divider: Int) -> Int? {
    if divider == 0 { return nil }
    if start >= 0 {
        return end / divider
    }
    if end <= 0 {
        return start / divider
    }
    return (end - start) / divider
}

if let result = printCount(start: start, end: end, divider: divider) {
    print("Count is: ", result)
} else {
    print("No solution!")
}

