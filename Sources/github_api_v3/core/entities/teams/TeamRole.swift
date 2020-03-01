//
//  File.swift
//  
//
//  Created by Francisco Romero on 26/02/20.
//

import Foundation

public enum TeamRole : String {
    
    case member     = "member"
    case maintainer = "maintainer"
    case all        = "all"    
    
    static func from(string: String) ->  TeamRole? {
        
        switch (string) {
        case TeamRole.member.rawValue : return .member
        case TeamRole.maintainer.rawValue : return .member
        case TeamRole.maintainer.rawValue : return .member
        default                       : return nil
        }
        
    }
}
