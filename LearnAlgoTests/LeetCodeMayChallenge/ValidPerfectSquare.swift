//
//  ValidPerfectSquare.swift
//  LearnAlgoTests
//
//  Created by Ky Nguyen on 5/12/20.
//  Copyright © 2020 Ky Nguyen. All rights reserved.
//

import XCTest

class ValidPerfectSquare: XCTestCase {
    /*
     Given a positive integer num, write a function which returns True if num is a perfect square else False.

     Note: Do not use any built-in library function such as sqrt.

     Example 1:

     Input: 16
     Output: true
     Example 2:

     Input: 14
     Output: false
     */

    func isPerfectSquare(_ num: Int) -> Bool {
        if num == 0 || num == 1 { return true }
        for i in 2 ... num / 2 {
            let product = i*i
            if product == num { return true }
            if product > num { return false }
        }
        return false
    }
    
    func testCase1() {
        let input = 16
        let output = true
        XCTAssertTrue(isPerfectSquare(input) == output)
    }
    func testCase2() {
        let input = 14
        let output = false
        XCTAssertTrue(isPerfectSquare(input) == output)
    }
}
