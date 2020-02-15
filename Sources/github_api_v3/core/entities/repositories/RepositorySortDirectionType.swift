//
//  File.swift
//  
//
//  Created by Francisco Romero on 08/02/20.
//

import Foundation

public enum RepositorySortDirectionType : String {
    
    case asc    = "asc"
    case desc   = "desc"
    
    static func from (string: String) -> RepositorySortDirectionType {
           
           switch (string) {
           
           case RepositorySortDirectionType.desc.rawValue   : return .desc
           default                                          : return .asc
               
           }
           
    }
    
}
