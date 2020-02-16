//
//  GHAffiliation.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/projects/


import Foundation

public enum GHAffiliation : String {
    
    // MARK: CASES
    //__________________________________________________________________________________________________________________
    case allAffiliatons     = "all"
    case directAffiliatons  = "direct"
    case outsideAffiliaton  = "outside"
    
    // MARK: STATIC FUNTIONS
    //__________________________________________________________________________________________________________________
    static func from(string: String) -> GHAffiliation{
        
        switch (string) {
        case GHAffiliation.directAffiliatons.rawValue    : return .directAffiliatons
        case GHAffiliation.outsideAffiliaton.rawValue    : return .outsideAffiliaton            
        default                                         : return .allAffiliatons
        }
        
    }
    
}
