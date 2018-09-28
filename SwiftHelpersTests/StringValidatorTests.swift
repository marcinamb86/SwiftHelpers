//
//  StringValidatorTests.swift
//  SwiftHelpersTests
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import XCTest

@testable
import SwiftHelpers

class StringValidatorTests : SwiftHelpersTests {
    
    func testEmailValidatorSuccess() {
        let email = "marcinamb86@icloud.com"
        
        XCTAssert(email.validator.isEmail)
    }
    
    func testEmailValidatorFailure() {
        let email = "wrong.email"
        
        XCTAssert(!email.validator.isEmail)
    }
    
    func testAlphanumericValidatorSuccess() {
        let email = "abc123DEF"
        
        XCTAssert(email.validator.isAlphanumeric)
    }
    
    func testAlphanumericValidatorFailure() {
        let email = "abc 123 DEF"
        
        XCTAssert(!email.validator.isAlphanumeric)
    }
    
}
