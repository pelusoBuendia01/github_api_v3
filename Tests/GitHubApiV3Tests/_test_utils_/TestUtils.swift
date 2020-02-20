//
//  File.swift
//  
//
//  Created by Francisco Romero on 19/02/20.
//

import Foundation

class TestUtils {
    
    
    
    
    private init() {
        
    }
    
    
    static let timeOut : TimeInterval = 1.0 // seconds
    
    
    static func  expectationString(cls: String, fun: String, desc: String) -> String {
        
        return "\n\t\(cls).\(fun): \(desc)\n"
        
    }
    
    static func  errorString(cls: String, fun: String, error: Error?) -> String {
        
        if let error = error {
            return "\n\t❌ \(cls).\(fun): \(error)\n"
        }
        else {
            return "\n\t❌ \(cls).\(fun): \n"
        }   
    }
        
}
