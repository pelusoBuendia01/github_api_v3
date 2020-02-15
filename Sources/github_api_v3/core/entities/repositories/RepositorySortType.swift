//
//  File.swift
//  
//
//  Created by Francisco Romero on 08/02/20.
//

import Foundation

public enum RepositorySortType : String {
    
    case created    = "created"
    case updated    = "updated"
    case pushed     = "pushed"
    case fullName   = "full_name"
    
    static func from (string: String) -> RepositorySortType{
        
        switch (string) {
        
        case RepositorySortType.created.rawValue    : return .created
        case RepositorySortType.updated.rawValue    : return .updated
        case RepositorySortType.pushed.rawValue     : return .pushed
        default                                     : return .fullName
            
        }
        
    }
    
}
