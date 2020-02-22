//
//  OrganizationFilter.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/orgs/members/#members-list

import Foundation

public enum OrganizationFilter: String {
    
    // MARK: CASES
    //__________________________________________________________________________________________________________________
    case all    = "all"
    case twoFactorAuthentication  = "2fa_disabled"
    
    // MARK: STATIC FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    public static func from (string: String) -> OrganizationFilter? {
        switch (string) {
        case Self.all.rawValue                      : return OrganizationFilter.all
        case Self.twoFactorAuthentication.rawValue  : return OrganizationFilter.twoFactorAuthentication
        default                                     : return nil
            
        }
    }
}
