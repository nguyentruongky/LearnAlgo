//
//  FloodFill.swift
//  LearnAlgoTests
//
//  Created by Ky Nguyen on 5/12/20.
//  Copyright © 2020 Ky Nguyen. All rights reserved.
//

import XCTest

class FloodFill: XCTestCase {
    
    /*
     https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3326/
     An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

     Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.

     To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

     At the end, return the modified image.
     
     Input:
     image = [[1,1,1],[1,1,0],[1,0,1]]
     sr = 1, sc = 1, newColor = 2
     Output: [[2,2,2],[2,2,0],[2,0,1]]
     Explanation:
     From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
     by a path of the same color as the starting pixel are colored with the new color.
     Note the bottom corner is not colored 2, because it is not 4-directionally connected
     to the starting pixel.
     
     ---
     Solution:
        - Run recursion for sr+1, sr-1, sc+1, sc-1 cases
        
     ---
     Edge case:
        - Same newColor = currentColor
        -> Use a map to mark visited
     */
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var newImage = image
        let startColor = image[sr][sc]
        var map = image
        fill(&newImage, &map, sr, sc, newColor, startColor)
        
        return newImage
    }
    
    func fill(_ image: inout [[Int]], _ map: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int, _ startColor: Int) {
        if sr >= image.count { return }
        if sc >= image[sr].count { return }
        if map[sr][sc] == -1 { return }
        if startColor != image[sr][sc] {
            return
        }
        image[sr][sc] = newColor
        map[sr][sc] = -1
        
        fill(&image, &map, sr + 1, sc, newColor, startColor)
        if sr > 0 {
            fill(&image, &map, sr - 1, sc, newColor, startColor)
        }
        
        fill(&image, &map, sr, sc + 1, newColor, startColor)
        if sc > 0 {
            fill(&image, &map, sr, sc - 1, newColor, startColor)
        }
    }
    func testCase1() {
        let input = [[1,1,1],[1,1,0],[1,0,1]]
        let output = [[2,2,2],[2,2,0],[2,0,1]]
        XCTAssertTrue(floodFill(input, 1, 1, 2) == output)
    }
    func testCase2() {
        let input = [[0,0,0],[0,1,1]]
        let output = [[0, 0, 0], [0, 1, 1]]
        XCTAssertTrue(floodFill(input, 1, 1, 1) == output)
    }
}
