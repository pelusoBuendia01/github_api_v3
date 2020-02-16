//
//  GHPermission.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/projects/

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
