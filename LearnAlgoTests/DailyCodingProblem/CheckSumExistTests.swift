//
//  CheckSumExist.swift
//  LearnAlgo
//
//  Created by Ky Nguyen on 5/12/20.
//  Copyright © 2020 Ky Nguyen. All rights reserved.
//

import Foundation
import XCTest

class CheckSumExistTests: XCTestCase {
    /*
     Good morning! Here's your coding interview problem for today.
     
     This problem was recently asked by Google.
     
     Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
     
     For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
     
     Bonus: Can you do this in one pass?
     ---
     Solution:
        - Save sum - value into dict
        - If exist a pair (value, sum-value) in the dict -> true
     
     Edge case: arr contains same values
     */
    
    func run(arr: [Int], sum: Int) -> Bool {
        var dict = [Int: Int]()
        for i in arr {
            if dict[sum - i] == i {
                return true
            }
            dict[i] = sum - i
        }
        return false
    }
    
    func testCase1() {
        let arr = [10, 15, 3, 7]
        let sum = 17
        XCTAssertTrue(run(arr: arr, sum: sum))
    }
    func testCase2() {
        let arr = [0, 4, 3, 7]
        let sum = 7
        XCTAssertTrue(run(arr: arr, sum: sum))
    }
    func testCase3() {
        let arr = [-1, 0, -1, 2]
        let sum = 7
        XCTAssertFalse(run(arr: arr, sum: sum))
    }

    
}

