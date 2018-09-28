//
//  ArrayHelpersTests.swift
//  SwiftHelpersTests
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import XCTest

@testable
import SwiftHelpers

class ArrayHelpersTests : SwiftHelpersTests {
    
    func testUpdateExistingElement() {
        var fruits = [Fruit(id: 1, name: "Apple"),
                      Fruit(id: 2, name: "Banana"),
                      Fruit(id: 3, name: "Orange")]
        
        fruits.update(Fruit(id: 3, name: "Pear"))
        
        XCTAssert(fruits.count == 3)
    }
    
    func testUpdateNewElement() {
        var fruits = [Fruit(id: 1, name: "Apple"),
                      Fruit(id: 2, name: "Banana"),
                      Fruit(id: 3, name: "Orange")]
        
        fruits.update(Fruit(id: 4, name: "Pear"))
        
        XCTAssert(fruits.count == 4)
    }
    
    func testUnique() {
        let fruits = [Fruit(id: 1, name: "Apple"),
                      Fruit(id: 2, name: "Banana"),
                      Fruit(id: 3, name: "Orange"),
                      Fruit(id: 4, name: "Pear"),
                      Fruit(id: 3, name: "Orange")]
        
        XCTAssert(fruits.unique().count == 4)
    }
    
    func testDictionary() {
        let fruits = [Fruit(id: 1, name: "Apple"),
                      Fruit(id: 2, name: "Banana"),
                      Fruit(id: 3, name: "Orange"),
                      Fruit(id: 4, name: "Pear")]
        
        let fruitsDictionary = fruits.dictionary { (fruit) -> (key: String, value: Any) in
            return (key: fruit.name, value: fruit.id)
        }
        
        XCTAssert(fruitsDictionary["Apple"] as? Int == 1)
        XCTAssert(fruitsDictionary["Banana"] as? Int == 2)
        XCTAssert(fruitsDictionary["Orange"] as? Int == 3)
        XCTAssert(fruitsDictionary["Pear"] as? Int == 4)
    }
    
    private struct Fruit : Equatable {
        let id: Int
        let name: String
        
        static func == (lhs: Fruit, rhs: Fruit) -> Bool {
            return lhs.id == rhs.id
        }
    }

}
