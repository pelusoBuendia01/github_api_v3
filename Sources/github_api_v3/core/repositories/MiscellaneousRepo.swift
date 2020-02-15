//
//  MiscellaneousRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol MiscellaneousRepo : GHRepository {
       
   // MARK: TYPEALIAS
   //__________________________________________________________________________________________________________________
    typealias ResultLicense     = (Result< LicenseEntity    ,Error> ) -> Void
    typealias ResultLicenseList = (Result<[LicenseEntity]   ,Error> ) -> Void
    
       
   // MARK: VARIABLES
   //__________________________________________________________________________________________________________________
       
   // MARK: FUNCTIONS
   //__________________________________________________________________________________________________________________
    
}
