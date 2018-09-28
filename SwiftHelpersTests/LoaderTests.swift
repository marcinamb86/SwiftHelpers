//
//  LoaderTests.swift
//  SwiftHelpersTests
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import XCTest

@testable
import SwiftHelpers

class LoaderTests : SwiftHelpersTests {
    
    func testLoad() {
        let loader = Loader({
            return Date().timeIntervalSince1970
        })
        
        let value1 = loader.object
        let value2 = loader.object
        
        XCTAssert(value1 == value2)
    }
    
    func testReload() {
        var loader = Loader({
            return Date().timeIntervalSince1970
        })
        
        let value1 = loader.object
        loader.reload()
        let value2 = loader.object
        
        XCTAssert(value1 != value2)
    }
    
}
