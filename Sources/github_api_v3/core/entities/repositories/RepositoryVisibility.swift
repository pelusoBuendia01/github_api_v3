//
//  GHRepositoryVisibility.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public enum RepositoryVisibility : String {
    
    case isPublic   = "public"
    case isPrivate  = "private"
    case isInternal = "internal"
    
    public static func from(string:String) -> RepositoryVisibility {
        switch string {
            case RepositoryVisibility.isPublic.rawValue   : return .isPublic
            case RepositoryVisibility.isPrivate.rawValue  : return .isPrivate
            case RepositoryVisibility.isInternal.rawValue : return .isInternal
        default: return .isPrivate
            
        }
    }
}
