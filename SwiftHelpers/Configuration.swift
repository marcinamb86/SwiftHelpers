//
//  Configuration.swift
//  SwiftHelpers
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import Foundation

public protocol Configuration : Decodable {
    
}

extension Configuration {
    
    public static func load(plistPath: String) throws -> Self {
        guard let plistData = try? Data(contentsOf: URL(fileURLWithPath: plistPath)) else {
            throw ConfigurationError.plistNotFound
        }
        
        guard let propertyListDictionary = (try? PropertyListSerialization.propertyList(from: plistData, format: nil)) as? [String : Any] else {
            throw ConfigurationError.incorrectPlist
        }
        
        let data = try! PropertyListSerialization.data(fromPropertyList: Self.configurationDictionary(fromPropertyListDictionary: propertyListDictionary), format: .binary, options: 0)
        
        let decoder = PropertyListDecoder()
        
        return try decoder.decode(Self.self, from: data)
    }
    
    private static func configurationDictionary(fromPropertyListDictionary dict: [String : Any]) -> [String : Any] {
        var configurationDictionary: [String : Any] = [:]
        
        dict.forEach({ (item) in
            let key = item.key.prefix(1).lowercased() + item.key.dropFirst()

            if let dict = item.value as? [String : Any] {
                configurationDictionary[key] = Self.configurationDictionary(fromPropertyListDictionary: dict)
                return
            }
            
            if let array = item.value as? [Any] {
                configurationDictionary[key] = Self.configurationArray(fromPropertyListArray: array)
                return
            }
            
            configurationDictionary[key] = item.value
        })
        
        return configurationDictionary
    }
    
    private static func configurationArray(fromPropertyListArray array: [Any]) -> [Any] {
        var configurationArray: [Any] = []
        
        array.forEach { (item) in
            if let dict = item as? [String : Any] {
                configurationArray.append(Self.configurationDictionary(fromPropertyListDictionary: dict))
                return
            }
            
            if let array = item as? [Any] {
                configurationArray.append(Self.configurationArray(fromPropertyListArray: array))
                return
            }
            
            configurationArray.append(item)
        }
        
        return configurationArray
    }
    
}

public enum ConfigurationError : Error {
    case plistNotFound
    case incorrectPlist
}
