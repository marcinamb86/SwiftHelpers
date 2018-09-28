//
//  UIColorHelpers.swift
//  SwiftHelpers
//
//  Created by Marcin Ambrochowicz on 28/09/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import Foundation

extension UIColor {
    
    public convenience init?(hex: String) {
        guard hex.count == 6 else {
            return nil
        }
        
        let scanner = Scanner(string: hex)
        
        var hexNumber: UInt64 = 0
        
        guard scanner.scanHexInt64(&hexNumber) else {
            return nil
        }
        
        let r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        let g = CGFloat((hexNumber & 0xff00) >> 8) / 255
        let b = CGFloat((hexNumber & 0xff) >> 0) / 255
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
}
