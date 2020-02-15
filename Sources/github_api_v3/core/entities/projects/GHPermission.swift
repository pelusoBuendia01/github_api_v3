//
//  GHProjectPermissionLevel.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public enum GHPermission : String {
    
    // MARK: CASES
    //__________________________________________________________________________________________________________________
    case admin  = "admin"
    case write  = "write"
    case read   = "read"
    case none   = "none"
    
    // MARK: STATIC FUNCTIONS
    //__________________________________________________________________________________________________________________
    public static func from(string:String) -> GHPermission {
        
        switch (string) {
            
        case "admin": return .admin
        case "write": return .write
        case "read" : return .read
        default     : return .none
            
        }
        
    }
    
}
