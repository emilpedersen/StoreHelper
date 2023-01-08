//
//  PropertyFile.swift
//  StoreHelper
//
//  Created by Russell Archer on 23/10/2021.
//

import Foundation

@available(iOS 15.0, macOS 12.0, watchOS 9.0, *)
public struct PropertyFile {
    
    /// Read a plist property file and return a dictionary of values
    public static func read(filename: String) -> [String : AnyObject]? {
        if let path = Bundle.main.path(forResource: filename, ofType: "plist") {
            if let contents = NSDictionary(contentsOfFile: path) as? [String : AnyObject] {
                return contents
            }
        }
        
        return nil  // [:]
    }
}


