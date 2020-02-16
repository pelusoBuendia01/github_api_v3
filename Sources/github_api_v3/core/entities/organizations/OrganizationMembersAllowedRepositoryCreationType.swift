//
//  File.swift
//  
//
//  Created by Francisco Romero on 16/02/20.
//

import Foundation

public enum OrganizationMembersAllowedRepositoryCreationType: String {
    
    // MARK: CASES
    //__________________________________________________________________________________________________________________
    
    case isAll        = "all"
    case isPrivate    = "private"
    case isNone       = "none"
    
    // MARK: PUBLIC SRTATIC FUNCTIONS
     //__________________________________________________________________________________________________________________
    
    static func from (string: String) -> OrganizationMembersAllowedRepositoryCreationType? {
        
        switch (string) {
        case OrganizationMembersAllowedRepositoryCreationType.isAll.rawValue      : return .isAll
        case OrganizationMembersAllowedRepositoryCreationType.isPrivate.rawValue  : return .isPrivate
        case OrganizationMembersAllowedRepositoryCreationType.isNone.rawValue     : return .isNone
        default                                                                   : return nil
            
        }
    
    }
    
}
