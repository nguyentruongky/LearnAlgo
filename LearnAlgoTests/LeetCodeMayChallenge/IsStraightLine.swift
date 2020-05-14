//
//  IsStraightLine.swift
//  LearnAlgoTests
//
//  Created by Ky Nguyen on 5/15/20.
//  Copyright © 2020 Ky Nguyen. All rights reserved.
//

import XCTest

class IsStraightLine: XCTestCase {
    /*
     You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.

     Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
     Output: true
     
     Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
     Output: false

     --- Solution
        - Find slopePoint of first 2 points = (x1-x2)/(y1-y2)
            - if y1-y2 == 0 return Infinity
        - Find slopePoint of every point with first point
            - slopePoint = 0 => horizontal line => check x difference
            - slopePoint = Infinity => vertical line => check y difference
            - Compare 2 slopePoint 
                
     */
    func run(_ coordinates: [[Int]]) -> Bool {
        if coordinates.count == 2 { return true }
        let pos1 = coordinates[0]
        let pos2 = coordinates[1]
        let slopePoint = findSlopePoint(pos1, pos2)
        for i in 2 ..< coordinates.count {
            let p = coordinates[i]
            let slopePoint1 = findSlopePoint(p, pos1)
            if slopePoint1 == Double.infinity && p[1] != pos1[1] {
                return false
            }
            if slopePoint1 == 0 && p[0] != pos1[0] {
                return false
            }
            if slopePoint != slopePoint1 {
                return false
            }
        }
        
        return true
    }
    
    func findSlopePoint(_ pos1: [Int], _ pos2: [Int]) -> Double {
        let x = pos1[0] - pos2[0]
        let y = pos1[1] - pos2[1]
        if y == 0 { return Double.infinity }
        let point = Double(x)/Double(y)
        return point
    }
    
    func testEdgeCase1() {
        let input = [[0,0],[0,1],[0,-1]]
        let expectation = true
        XCTAssertTrue(run(input) == expectation)
    }
    func testEdgeCase2() {
        let input = [[0,0],[1,0],[2,0]]
        let expectation = true
        XCTAssertTrue(run(input) == expectation)
    }
    func testCase1() {
        let input = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
        let expectation = true
        XCTAssertTrue(run(input) == expectation)
    }
    func testCase2() {
        let input = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
        let expectation = false
        XCTAssertTrue(run(input) == expectation)
    }
    func testCase3() {
        let input = [[2,1],[4,2],[6,3]]
        let expectation = true
        XCTAssertTrue(run(input) == expectation)
    }
    func testCase4() {
        let input = [[1,1],[2,2],[2,0]]
        let expectation = false
        XCTAssertTrue(run(input) == expectation)
    }
}
