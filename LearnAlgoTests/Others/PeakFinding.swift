//
//  PeakFinding.swift
//  LearnAlgoTests
//
//  Created by Ky Nguyen on 5/13/20.
//  Copyright © 2020 Ky Nguyen. All rights reserved.
//

import XCTest

class PeakFinding: XCTestCase {

    /*
     https://leetcode.com/articles/find-peak-element/
     A peak element is an element that is greater than its neighbors.

     Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

     The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

     You may imagine that nums[-1] = nums[n] = -∞.

     Example 1:

     Input: nums = [1,2,3,1]
     Output: 2
     Explanation: 3 is a peak element and your function should return the index number 2.
     Example 2:

     Input: nums = [1,2,1,3,5,6,4]
     Output: 1 or 5
     Explanation: Your function can return either index number 1 where the peak element is 2,
                  or index number 5 where the peak element is 6.
     Note:

     Your solution should be in logarithmic complexity.
     
     ---
     Notes: Be careful with pass index into findPeakItem
     */
    func run(_ nums: [Int]) -> Int {
        return findPeakItem(nums, 0)
    }
    func findPeakItem(_ nums: [Int], _ index: Int) -> Int {
        if nums.count == 1 {
            return 0
        }
        
        if nums.count == 2 {
            return index + (nums[0] > nums[1] ? 0 : 1)
        }
        
        let i = nums.count/2
        let center = nums[i]
        if i-1 < 0 || i+1 > nums.count {
            return -1
        }
        
        if nums[i-1]<=center && center>=nums[i+1] {
            return i + index
        }
        
        if nums[i-1] > center {
            let result = findPeakItem(Array(nums[0...i]), index)
            if result == -1 {
                return findPeakItem(Array(nums[i..<nums.count]), i + index)
            } else {
                return result
            }
        }
        
        if nums[i+1] > center {
            let result = findPeakItem(Array(nums[i..<nums.count]), i + index)
            if result == -1 {
                return findPeakItem(Array(nums[0...i]), index)
            } else {
                return result
            }
        }
        
        return -1
    }
    
    func testCase1() {
        let arr = [1,2,1,3,5,6,4]
        let expectResult = 5
        XCTAssertTrue(run(arr) == expectResult)
    }
    func testCase2() {
        let arr = [1,2,3,1]
        let expectResult = 2
        XCTAssertTrue(run(arr) == expectResult)
    }
    func testCase3() {
        let arr = [1]
        let expectResult = 0
        XCTAssertTrue(run(arr) == expectResult)
    }
    func testCase4() {
        let arr = [1, 5]
        let expectResult = 1
        XCTAssertTrue(run(arr) == expectResult)
    }
    func testCase5() {
        let arr = [5, 5]
        XCTAssertTrue(arr[run(arr)] == 5)
    }
    func testCase6() {
        let arr = [1, 2, 3]
        let expectResult = 2
        XCTAssertTrue(run(arr) == expectResult)
    }
    func testCase7() {
        let arr = [1, 2, 3, 4, 5]
        let expectResult = 4
        XCTAssertTrue(run(arr) == expectResult)
    }
    func testCase8() {
        let arr = [1, 2, 3, 4, 5, 2, 1]
        let expectResult = 4
        XCTAssertTrue(run(arr) == expectResult)
    }
}
