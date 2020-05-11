//
//  FindTheTownJudge.swift
//  LearnAlgoTests
//
//  Created by Ky Nguyen on 5/12/20.
//  Copyright © 2020 Ky Nguyen. All rights reserved.
//

import XCTest

class FindTheTownJudge: XCTestCase {
    /*
     https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3325/
     In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.
     
     If the town judge exists, then:
     
     The town judge trusts nobody.
     Everybody (except for the town judge) trusts the town judge.
     There is exactly one person that satisfies properties 1 and 2.
     You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.
     
     If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.

     Example 1:
     
     Input: N = 2, trust = [[1,2]]
     Output: 2
     Example 2:
     
     Input: N = 3, trust = [[1,3],[2,3]]
     Output: 3
     Example 3:
     
     Input: N = 3, trust = [[1,3],[2,3],[3,1]]
     Output: -1
     Example 4:
     
     Input: N = 3, trust = [[1,2],[2,3]]
     Output: -1
     Example 5:
     
     Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
     Output: 3
     
     Note:
     
     1 <= N <= 1000
     trust.length <= 10000
     trust[i] are all different
     trust[i][0] != trust[i][1]
     1 <= trust[i][0], trust[i][1] <= N
     
     ---
     Explanation
     [1]: [2, 3, 4]
     [2]: [1, 3]
     [3]: []
     [4]: [1, 2, 3]
     
     ---
     Solution:
     loop 1: fill trustDict
     loop 2: find person not exist in trustDict -> false -> return -1
         if 2 people not exist -> return -1
     loop 3: if foundPerson exist in the value of trustDict

     
     
     */
    
    
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var trustDict = [Int: [Int: Bool]]()

        for item in trust {
            let first = item[0]
            let sec = item[1]
            
            var value = trustDict[first] ?? [Int: Bool]()
            
            value[sec] = true
            trustDict[first] = value
        }
        
        var maybe = [Int]()
        for i in 1 ..< N + 1 {
            if trustDict[i] == nil {
                maybe.append(i)
            }
            if maybe.count > 1 {
                return -1
            }
        }
        
        if maybe.isEmpty { return -1 }
        
        let lastCheck = maybe[0]
        for item in trustDict {
            if item.value[lastCheck] == nil {
                return -1
            }
        }
        
        return lastCheck
    }
    
    func testCase1() {
        let N = 2
        let arr = [[1,2]]
        let result = 2
        XCTAssertTrue(findJudge(N, arr) == result)
    }
    func testCase2() {
        let N = 3
        let arr = [[1,3],[2,3]]
        let result = 3
        XCTAssertTrue(findJudge(N, arr) == result)
    }
    func testCase3() {
        let N = 3
        let arr = [[1,3],[2,3],[3,1]]
        let result = -1
        XCTAssertTrue(findJudge(N, arr) == result)
    }
    func testCase4() {
        let N = 3
        let arr = [[1,2],[2,3]]
        let result = -1
        XCTAssertTrue(findJudge(N, arr) == result)
    }
    func testCase5() {
        let N = 4
        let arr = [[1,3],[1,4],[2,3],[2,4],[4,3]]
        let result = 3
        XCTAssertTrue(findJudge(N, arr) == result)
    }
}
