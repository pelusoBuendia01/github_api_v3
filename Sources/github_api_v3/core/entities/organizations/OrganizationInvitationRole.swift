//
//  OrganizationInvitationRole.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/orgs/members/#members-list

import Foundation

public enum OrganizationInvitationRole : String  {
    
    // MARK: CASES
    //__________________________________________________________________________________________________________________
    case billingManager = "billing_manager"
    case admin          = "admin"
    case directMember   = "direct_member"
    
    // MARK: STATIC FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    public static func from (string: String) -> OrganizationInvitationRole? {
        switch (string) {
        case Self.billingManager.rawValue   : return OrganizationInvitationRole.billingManager
        case Self.admin.rawValue            : return OrganizationInvitationRole.admin
        case Self.directMember.rawValue     : return OrganizationInvitationRole.directMember
        default                             : return nil
            
        }
    }
}
