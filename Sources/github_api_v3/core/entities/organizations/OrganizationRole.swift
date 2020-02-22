//
//  OrganizationRole.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/orgs/members/#members-list

import Foundation

public enum OrganizationRole : String {
    
    // MARK: CASES
    //__________________________________________________________________________________________________________________
    case all    = "all"
    case admin  = "admin"
    case member = "member"
    
    // MARK: STATIC FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    public static func from (string: String) -> OrganizationRole? {
        switch (string) {
        case Self.admin.rawValue    : return OrganizationRole.admin
        case Self.member.rawValue   : return OrganizationRole.member
        case Self.all.rawValue      : return OrganizationRole.all
        default                     : return nil
            
        }
    }
    
    
}
