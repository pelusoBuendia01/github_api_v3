
//
//  GHCodabl.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

public protocol GHCodable : Codable {
    
}

public extension GHCodable {
    
    func debugDescription() -> String {
        
        /// initialize local variables
        let mirror      = Mirror(reflecting: self)
        var description = "{"
        
        /// loop over every attribute
        for (index,attr) in mirror.children.enumerated() {
                        
            if let label = attr.label {
                
                let value : String
                
                
                
                if ( (type(of: attr.value)  == Int.self      ) ||
                     (type(of: attr.value)  == String.self   ) ||
                     (type(of: attr.value)  == Bool.self     )
                ) {
                    
                    value = "\(attr.value)"
                    
                }
                else if (
                     (type(of: attr.value)  == Int?.self     )
                ) {
                    
                    if let int = attr.value as? Int {
                        value = "\(int)"
                    } else {
                        value = "<Int=nil>"
                    }
                }
                else if (
                     (type(of: attr.value)  == String?.self  )
                ) {
                    
                    if let string = attr.value as? String {
                        value = "\(string)"
                    } else {
                        value = "<String=nil>"
                    }
                    
                    
                }
                else if (
                     (type(of: attr.value)  == Bool?.self    )
                ) {
                    
                    
                    if let bool = attr.value as? Bool {
                        value = "\(bool)"
                    } else {
                        value = "<Bool=nil>"
                    }
                }
                else if (
                     (type(of: attr.value)  == Date?.self    )
                ) {
                    
                    
                    if let date = attr.value as? Date {
                        value = "\(date)"
                    } else {
                        value = "<Date=nil>"
                    }
                }
                else {
                                
                    if let _ = attr.value as? GHCodable {
                        value = "\(type(of: attr.value))"
                    } else {
                        
                        
                        
                        var tmp = "\(type(of: attr.value))"
                        
                        if (tmp.contains("Optional<")) {
                            tmp = ""+tmp.components(separatedBy: "<").last!
                            tmp = tmp.components(separatedBy: ">").first!+">"
                        }
                        
                        value = tmp
                    }
                    
                }
                
                
                
                if (index > 0) {
                    description += ", \(label): \(value)"
                } else {
                    description += " \(label): \(value)"
                }
            }
            
        }
        
        description += " }"
        
        return description
    }
    
}
