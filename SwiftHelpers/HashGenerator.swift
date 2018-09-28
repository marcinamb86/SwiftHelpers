//
//  HashGenerator.swift
//  SwiftHelpers
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import Foundation
import CommonCrypto

public struct HashGenerator {
    
    public init(_ value: String) {
        self.value = value
    }
    
    public init(_ value: Int) {
        self.value = String(value)
    }
    
    private let value: String
    
}

extension HashGenerator {
    
    public func md5() -> String {
        
        let string = value.cString(using: String.Encoding.utf8)
        let stringLength = CC_LONG(value.lengthOfBytes(using: String.Encoding.utf8))
        let digestLength = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLength)
        let hash = NSMutableString()
        
        CC_MD5(string, stringLength, result)
        
        for i in 0..<digestLength {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate()
        
        return String(format: hash as String)
        
    }
    
}
