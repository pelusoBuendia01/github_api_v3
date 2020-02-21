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
     
    /// getEmojiList
    ///
    /// - parameter result: the callback competition
    /// - returns: Void
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
     
    
    ///
    ///
    /// - parameter result: the callback competition
    /// - returns: Void
    func gitIgnoreNames         (result     : @escaping ResultGitIgnoreList ) -> Void
    
    
    /// gitIgnoreTemplate
    ///
    /// - parameter name: git ignore name
    /// - parameter result: the callback competition
    /// - returns: Void
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
     
    
    /// licenseList
    ///
    /// - parameter result: the callback competition
    /// - returns: Void
    func licenseList        ( result    : @escaping ResultGitLicenseList ) -> Void
     
    
    /// single
    ///
    /// - parameter name: license name
    /// - parameter result: the callback competition
    /// - returns: Void
    func single             ( name      : String,
                              result    : @escaping ResultGitLicense) -> Void
    
    
    /// licenseIn
    ///
    /// - parameter owner: organization user username
    /// - parameter repo: repository name
    /// - parameter result: the callback competition
    /// - returns: Void
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
    
    
    /// renderMarkdown
    ///
    /// - parameter text: text to render
    /// - parameter result: the callback competition
    /// - returns: Void
    func renderMarkdown             (text   : String,
                                     result : @escaping ResultRender    ) -> Void
    
    
    /// renderMarkdownRaw
    ///
    /// - parameter text: text to render
    /// - parameter result: the callback competition
    /// - returns: Void
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
     
    /// get meta
    ///
    /// - parameter result: the callback competition
    /// - returns: Void
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
     
    /// get  rate limit information
    ///
    /// - parameter result: the callback competition
    /// - returns: Void
    func    get                     (result : @escaping ResultRateLimit    ) -> Void
        
}


