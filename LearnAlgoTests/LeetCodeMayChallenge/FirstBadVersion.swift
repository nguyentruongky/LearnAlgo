//
//  FirstBadVersion.swift
//  LearnAlgoTests
//
//  Created by Ky Nguyen on 5/12/20.
//  Copyright © 2020 Ky Nguyen. All rights reserved.
//

import XCTest

class FirstBadVersion: XCTestCase {
    /*
     You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

     Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

     You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

     Example:

     Given n = 5, and version = 4 is the first bad version.

     call isBadVersion(3) -> false
     call isBadVersion(5) -> true
     call isBadVersion(4) -> true

     Then 4 is the first bad version.
     */
    
    func firstBadVersion(_ n: Int, badVersion: Int) -> Int {
        func isBadVersion(_ version: Int) -> Bool {
            return version >= badVersion
        }

        func search(start: Int, end: Int) -> (Int, Int) {
            if (abs(end - start) <= 1) {
                return (start, end)
            }
            
            let center = (end - start)/2 + start
            while isBadVersion(center) {
                return search(start: start, end: center)
            }
            
            return search(start: center, end: end)
        }
        
        let (start, end) = search(start: 1, end: n)
        
        for i in start...end {
            if isBadVersion(i) == true {
                return i
            }
        }

        return end
    }
    
    func testCase1() {
        
    }
}
