//
//  File.swift
//  
//
//  Created by Francisco Romero on 16/02/20.
//

import Foundation



public enum OrganizationRepositoryPermission : String {
        
    
    // MARK: CASES
    //__________________________________________________________________________________________________________________
   
    case read = "read"
    case write = "write"
    case admin = "admin"
    case none = "none"
    
    
    // MARK: PUBLIC STATIC FUNCTIONS
    //__________________________________________________________________________________________________________________
    static func from (string: String) -> OrganizationRepositoryPermission {
    
        switch (string) {
        case OrganizationRepositoryPermission.write.rawValue    : return .write
        case OrganizationRepositoryPermission.admin.rawValue    : return .admin
        case OrganizationRepositoryPermission.none.rawValue     : return .none
        default                                                 : return .read
            
        }
    }
    
    
}
