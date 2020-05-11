//
//  ProductsNotAtIndexTests.swift
//  LearnAlgoTests
//
//  Created by Ky Nguyen on 5/12/20.
//  Copyright © 2020 Ky Nguyen. All rights reserved.
//

import Foundation
import XCTest

class ProductsNotAtIndexTests: XCTestCase {
    /*
     Good morning! Here's your coding interview problem for today.

     This problem was asked by Uber.

     Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.

     For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].

     Follow-up: what if you can't use division?
     
     ----
     [1, 2, 3, 4, 5] -> [2*3*4*5, 1*3*4*5, 1*2*4*5, 1*2*3*5, 1*2*3*4] -> [120, 60, 40, 30, 24]
    
     ---
     Edge case: contain 0
     */
    
    func multiply(_ arr: [Int]) -> [Int] {
        var newArray = arr
        var product = 1
        var saveProduct = 1
        for i in arr {
            product *= i
            if i != 0 {
                saveProduct = saveProduct * i
            }
        }
        
        for i in 0 ..< newArray.count {
            if newArray[i] == 0 {
                newArray[i] = saveProduct
            } else {
                newArray[i] = product/newArray[i]
            }
        }
        
        return newArray
    }
    
    func multiplyNoDivision(_ arr: [Int]) -> [Int] {
        var newArray = [Int]()
        var product = 1
        // 2, 3, 4
        // product = 1 => add product * j (j: i + 1 -> end) -> new array
        // product = product*i
        for i in 0 ..< arr.count {
            var result = product
            for j in i + 1 ..< arr.count {
                result *= arr[j]
            }
            newArray.append(result)
            product = product*arr[i]
        }
        
        return newArray
    }

    func testCase1() {
        let arr = [1, 2, 3]
        let result = [6, 3, 2]
        XCTAssertTrue(multiply(arr) == result)
        XCTAssertTrue(multiplyNoDivision(arr) == result)
    }
    
    func testCase2() {
        let arr = [1, 2, 8]
        let result = [16, 8, 4]
        XCTAssertTrue(multiply(arr) != result)
        XCTAssertTrue(multiplyNoDivision(arr) != result)
    }
    func testCase3() {
        let arr = [10, 1, 2, 8, 11, -1]
        let result = [-176, -1760, -880, -220, -160, 1760]
        XCTAssertTrue(multiply(arr) == result)
        XCTAssertTrue(multiplyNoDivision(arr) == result)
    }
    
    func testCase4() {
        let arr = [0, 3, 5, 1]
        let result = [15, 0, 0, 0]
        XCTAssertTrue(multiply(arr) == result)
        XCTAssertTrue(multiplyNoDivision(arr) == result)
    }
}
