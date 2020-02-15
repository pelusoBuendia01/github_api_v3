//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol DismissalRestrictionsEntity : GHCodable {
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    var usernames   : [String]  { get }
    var teamSlugs   : [String]  { get }
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
    
}
