//
//  GHProjectAffiliaton.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public enum GHAffiliation : String {
    
    // MARK: CASES
    //__________________________________________________________________________________________________________________
    case allAffiliatons     = "all"
    case directAffiliatons  = "direct"
    case outsideAffiliaton  = "outside"
    
    static func from(string: String) -> GHAffiliation{
        
        switch (string) {
        case GHAffiliation.directAffiliatons.rawValue    : return .directAffiliatons
        case GHAffiliation.outsideAffiliaton.rawValue    : return .outsideAffiliaton            
        default                                         : return .allAffiliatons
        }
        
    }
    
}
