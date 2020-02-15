//
//  File.swift
//  
//
//  Created by Francisco Romero on 08/02/20.
//

import Foundation

public enum RepositoryType : String {
    case all    = "all"
    case owner  = "owner"
    case member = "member"
    
    static func from (string: String) -> RepositoryType{
        
        switch (string) {
        
        case RepositoryType.all.rawValue    : return .all
        case RepositoryType.member.rawValue : return .member
        default                             : return .owner
            
        }
        
    }
}
