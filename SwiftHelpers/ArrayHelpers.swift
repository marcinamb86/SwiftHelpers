//
//  ArrayHelpers.swift
//  SwiftHelpers
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import Foundation

extension Array {
    
    public func dictionary(_ converter: ((Element) -> (key: String, value: Any))) -> [String : Any] {
        var dict: [String : Any] = [:]
        
        forEach { (element) in
            let converter = converter(element)
            dict[converter.key] = converter.value
        }
        
        return dict
    }
    
}

extension Array where Element : Equatable {
    
    public mutating func update(_ element: Element) {
        if let index = firstIndex(of: element) {
            self[index] = element
        } else {
            append(element)
        }
    }
    
    public func unique() -> [Element] {
        var uniqueArray = [Element]()
        for element in self {
            if !uniqueArray.contains(element) {
                uniqueArray.append(element)
            }
        }
        
        return uniqueArray
    }
    
}
