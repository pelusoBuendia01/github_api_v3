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
    
    typealias ResultLicense             = (Result< LicenseEntity            ,Error> ) -> Void
    typealias ResultLicenseList         = (Result<[LicenseEntity]           ,Error> ) -> Void
    
       
   // MARK: VARIABLES
   //__________________________________________________________________________________________________________________
    
    var emojis      : MiscellaneousEmojisRepo       { get }
    var gitIgnores  : MiscellaneousGitIgnoresRepo   { get }
    var licenses    : MiscellaneousLicensesRepo     { get }
    var markdown    : MiscellaneousMarkdownRepo     { get }
    var meta        : MiscellaneousMetaRepo         { get }
    var rateLimit   : MiscellaneousRateLimitRepo    { get }
       
    
   // MARK: FUNCTIONS
   //__________________________________________________________________________________________________________________
    
}

public protocol MiscellaneousEmojisRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultEmojist            = (Result<[String:String]    ,Error> ) -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
     
    func    getEmojiList                (result : @escaping ResultEmojist    ) -> Void
        
}


public protocol MiscellaneousGitIgnoresRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultGitIgnoreList       = (Result<[String]                  ,Error> ) -> Void
    typealias ResultGitIgnoreTemplate   = (Result<GitignoreTemplateEntity   ,Error> ) -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
     
    func gitIgnoreNames         (result     : @escaping ResultGitIgnoreList ) -> Void
     
    func gitIgnoreTemplate      (name       : String,
                                 result     : @escaping ResultGitIgnoreTemplate) -> Void
    
}


public protocol MiscellaneousLicensesRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultGitLicense       = (Result<LicenseEntity    ,Error> ) -> Void
    typealias ResultGitLicenseList   = (Result<[LicenseEntity]  ,Error> ) -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
     
    func licenseList        ( result    : @escaping ResultGitLicenseList ) -> Void
     
    func single             ( name      : String,
                              result    : @escaping ResultGitLicense) -> Void
    
    func licenseIn          ( owner     : String,
                              repo      : String,
                              result    : @escaping ResultGitLicense ) -> Void
    
    
}


public protocol MiscellaneousMarkdownRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultRender          = (Result<String    ,Error> ) -> Void
    typealias ResultGitLicenseList  = (Result<[LicenseEntity]  ,Error> ) -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
     
    func renderMarkdown             (text   : String,
                                     result : @escaping ResultRender    ) -> Void
    
    func renderMarkdownRaw          (text   : String,
                                     result : @escaping ResultRender    ) -> Void
    
}


public protocol MiscellaneousMetaRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultMeta            = (Result<MetaEntity    ,Error> ) -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
     
    func    get                     (result : @escaping ResultMeta    ) -> Void
        
}


public protocol MiscellaneousRateLimitRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultRateLimit            = (Result<RateLimitEntity    ,Error> ) -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
     
    func    get                     (result : @escaping ResultRateLimit    ) -> Void
        
}


