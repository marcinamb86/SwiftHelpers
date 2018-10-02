//
//  ConfigurationTests.swift
//  SwiftHelpersTests
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import XCTest

@testable
import SwiftHelpers

class ConfigurationTests : SwiftHelpersTests {
    
    func testConfiguration() {
        let path = testsBundle.path(forResource: "ConfigurationTests", ofType: "plist")!
        
        let configurationTests = try? ConfigurationTests.load(plistPath: path)
        XCTAssert(configurationTests?.key1 == "String value")
        XCTAssert(configurationTests?.key2 == 100)
        XCTAssert(configurationTests?.key3 == true)
        XCTAssert(configurationTests?.key4.timeIntervalSince1970 == 1534590000.0)
        XCTAssert(configurationTests?.key5.subKey1 == "String sub value")
        XCTAssert(configurationTests?.key6.first?.subKey1 == "String sub value")
        XCTAssert(configurationTests?.key7.first?.first == "String sub value")
    }
    
    func testPlistNotFound() {
        XCTAssertThrowsError(_ = try ConfigurationTests.load(plistPath: "")) { (error) in
            XCTAssert((error as? ConfigurationError) == ConfigurationError.plistNotFound)
        }
    }
    
    func testIncorrectPlist() {
        let incorrectPlistPath = NSHomeDirectory().appending("/Documents").appending("ConfigurationIncorrectTests.plist")
        (["Test"] as NSArray).write(toFile: incorrectPlistPath, atomically: true)
        
        XCTAssertThrowsError(_ = try ConfigurationTests.load(plistPath: incorrectPlistPath)) { (error) in
            XCTAssert((error as? ConfigurationError) == ConfigurationError.incorrectPlist)
        }
    }
    
    private struct ConfigurationTests : Configuration {
        let key1: String
        let key2: Int
        let key3: Bool
        let key4: Date
        let key5: Key5
        let key6: [Key6]
        let key7: [[String]]
        
        public struct Key5 : Decodable {
            let subKey1: String
        }
        
        public struct Key6 : Decodable {
            let subKey1: String
        }
    }
    
}
