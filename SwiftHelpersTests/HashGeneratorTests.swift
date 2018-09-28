//
//  HashGeneratorTests.swift
//  SwiftHelpersTests
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import XCTest

@testable
import SwiftHelpers

class HashGeneratorTests : SwiftHelpersTests {
    
    func testMD5FromString() {
        let md5 = HashGenerator("test").md5()
        
        XCTAssert(md5 == "098f6bcd4621d373cade4e832627b4f6")
    }
    
    func testMD5FromInt() {
        let md5 = HashGenerator(123).md5()
        
        XCTAssert(md5 == "202cb962ac59075b964b07152d234b70")
    }
    
}
