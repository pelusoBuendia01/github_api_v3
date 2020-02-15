//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol RequiredStatusChecksEntity : GHCodable{
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    var strict  : Bool      { get }
    var context : [String]  { get }
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}
