//
//  MiscellaneousRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com

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
