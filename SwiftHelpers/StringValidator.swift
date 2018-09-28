//
//  StringValidator.swift
//  SwiftHelpers
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import Foundation

public struct StringValidator {
    
    public init(_ value: String) {
        self.value = value
    }
    
    private let value: String
    
}

extension StringValidator {
    
    public var isEmail: Bool {
        let expression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let result = NSPredicate(format: "SELF MATCHES %@", expression)
        
        return result.evaluate(with: value)
    }
    
    public var isAlphanumeric: Bool {
        let characterSet = CharacterSet.alphanumerics.inverted
        
        let range = value.rangeOfCharacter(from: characterSet)
        
        return range?.lowerBound == range?.upperBound
    }
    
}

extension String {
    
    public var validator: StringValidator {
        return StringValidator(self)
    }
    
}
