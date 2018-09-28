//
//  UIColorHelpersTests.swift
//  SwiftHelpersTests
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import XCTest

@testable
import SwiftHelpers

class UIColorHelpersTests : SwiftHelpersTests {
    
    func testIncorrectStringHexColor() {
        let color = UIColor(hex: "FF00")
        
        XCTAssert(color == nil)
    }
    
    func testIncorrectHexColor() {
        let color = UIColor(hex: "ZZZZZZ")
        
        XCTAssert(color == nil)
    }
    
    func testHexColor() {
        let color = UIColor(hex: "FF0000")
        
        XCTAssert(color == UIColor.red)
    }
    
}
