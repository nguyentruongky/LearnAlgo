//
//  Trie.swift
//  LearnAlgoTests
//
//  Created by Ky Nguyen on 5/15/20.
//  Copyright © 2020 Ky Nguyen. All rights reserved.
//

import XCTest

class TrieTest: XCTestCase {
    /*
     https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3329/
     Implement a trie with insert, search, and startsWith methods.

     Example:

     Trie trie = new Trie();

     trie.insert("apple");
     trie.search("apple");   // returns true
     trie.search("app");     // returns false
     trie.startsWith("app"); // returns true
     trie.insert("app");
     trie.search("app");     // returns true
     Note:

     You may assume that all inputs are consist of lowercase letters a-z.
     All inputs are guaranteed to be non-empty strings.

     */
    func testCase1() {
        let trie = Trie()
        trie.insert("hello")
        trie.insert("help")
        XCTAssertTrue(trie.search("hell") == false)
        XCTAssertTrue(trie.search("helloa") == false)
        XCTAssertTrue(trie.search("hello") == true)
        
        XCTAssertTrue(trie.startsWith("help") == true)
        XCTAssertTrue(trie.startsWith("hellp") == false)
    }

}
class Trie {
    var label: String = "#"
    var children = [String: Trie]()
    var isEndOfWord = false
    
    func insert(_ word: String) {
        var newString = word
        var node = self
        while newString.isEmpty == false {
            let c = String(newString.removeFirst())
            node = node.addChar(c)
        }
        node.isEndOfWord = true
    }
    private func addChar(_ ch: String) -> Trie {
        if let node = children[ch] {
            return node
        } else {
            // add new node
            let node = Trie()
            node.label = ch
            children[ch] = node
            return node
        }
    }
    func startsWith(_ prefix: String) -> Bool {
        var newString = prefix
        var node = self
        while newString.isEmpty == false {
            let c = String(newString.removeFirst())
            if let found = node.children[c] {
                node = found
            } else {
                return false
            }
        }
        return true
    }
    func search(_ word: String) -> Bool {
        var newString = word
        var node = self
        while newString.isEmpty == false {
            let c = String(newString.removeFirst())
            if let found = node.children[c] {
                node = found
            } else {
                return false
            }
        }
        return node.isEndOfWord
    }
}
