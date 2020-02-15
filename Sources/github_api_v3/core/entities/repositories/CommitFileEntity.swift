//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol CommitFileEntity : GHCodable {
 
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var filename    : String    {get}
    var additions   : Int       {get}
    var deletions   : Int       {get}
    var changes     : Int       {get}
    var status      : String    {get}
    var rawURL      : String    {get}
    var blobURL     : String    {get}
    var patch       : String    {get}
    
}

