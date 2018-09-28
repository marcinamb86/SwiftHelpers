//
//  Loader.swift
//  SwiftHelpers
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import Foundation

public struct Loader<T> {
    
    public init(_ loader: @escaping (() -> T)) {
        self.loader = loader
        self.object = loader()
    }
    
    public mutating func reload() {
        object = loader()
    }
    
    public private(set) var object: T
    
    private let loader: (() -> T)
    
}
