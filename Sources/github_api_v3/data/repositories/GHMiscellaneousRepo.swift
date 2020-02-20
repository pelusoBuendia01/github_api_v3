//
//  File.swift
//  
//
//  Created by Francisco Romero on 15/02/20.
//

import Foundation

internal class GHMiscellaneousRepo: MiscellaneousRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    var emojis      : MiscellaneousEmojisRepo
    var gitIgnores  : MiscellaneousGitIgnoresRepo
    var licenses    : MiscellaneousLicensesRepo
    var markdown    : MiscellaneousMarkdownRepo
    var meta        : MiscellaneousMetaRepo
    var rateLimit   : MiscellaneousRateLimitRepo
    
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [MiscellaneousRepo]
    //__________________________________________________________________________________________________________________
    public var session: GHSession
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        
        /// initialize instance properties
        self.session = session
        
        self.emojis     = GHMiscellaneousEmojisRepo(session:self.session)
        self.gitIgnores = GHMiscellaneousGitIgnoresRepo(session:self.session)
        self.licenses   = GHMiscellaneousLicensesRepo(session:self.session)
        self.markdown   = GHMiscellaneousMarkdownRepo(session:self.session)
        self.meta       = GHMiscellaneousMetaRepo(session:self.session)
        self.rateLimit  = GHMiscellaneousRateLimitRepo(session:self.session)
        
    }
    
    // MARK: OVERRIDE FUNCTIONS FROM [MiscellaneousRepo]
    //__________________________________________________________________________________________________________________
    
}

class GHMiscellaneousEmojisRepo: MiscellaneousEmojisRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________
    public var session: GHSession
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
    // MARK: OVERRIDE FUNCTIONS FROM [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________
    
    func getEmojiList(result: @escaping ResultEmojist) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousEmojisRepo.getEmojiList: 🚧 Not Implemented")))
    }
    
}


class GHMiscellaneousGitIgnoresRepo: MiscellaneousGitIgnoresRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________
    
    public var session: GHSession
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        self.session = session
    }
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________
    
    func gitIgnoreNames(result: @escaping ResultGitIgnoreList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousGitIgnoresRepo.gitIgnoreNames: 🚧 Not Implemented")))
    }
    
    func gitIgnoreTemplate(name: String, result: @escaping ResultGitIgnoreTemplate) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousGitIgnoresRepo.gitIgnoreTemplate: 🚧 Not Implemented")))
    }
    
    
}

class GHMiscellaneousLicensesRepo: MiscellaneousLicensesRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________
    public var session: GHSession
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
    // MARK: OVERRIDE FUNCTIONS FROM [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________
    
    func licenseList(result: @escaping ResultGitLicenseList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousLicensesRepo.licenseList: 🚧 Not Implemented")))
    }
    
    func single(name: String, result: @escaping ResultGitLicense) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousLicensesRepo.single: 🚧 Not Implemented")))
    }
    
    func licenseIn(owner: String, repo: String, result: @escaping ResultGitLicense) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousLicensesRepo.licenseIn: 🚧 Not Implemented")))
    }
    
}



class GHMiscellaneousMarkdownRepo: MiscellaneousMarkdownRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________
    
    public var session: GHSession
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        self.session = session
    }
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________

    func renderMarkdown(text: String, result: @escaping ResultRender) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousMarkdownRepo.renderMarkdown: 🚧 Not Implemented")))
    }
    
    func renderMarkdownRaw(text: String, result: @escaping ResultRender) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousMarkdownRepo.renderMarkdownRaw: 🚧 Not Implemented")))
    }
    
}

class GHMiscellaneousMetaRepo: MiscellaneousMetaRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________
    public var session: GHSession
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
    // MARK: OVERRIDE FUNCTIONS FROM [MiscellaneousEmojisRepo]
    //__________________________________________________________________________________________________________________
    
    func get(result: @escaping ResultMeta) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousMetaRepo.get: 🚧 Not Implemented")))
    }
    
}

class GHMiscellaneousRateLimitRepo: MiscellaneousRateLimitRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [MiscellaneousReateLimitRepo]
    //__________________________________________________________________________________________________________________
    public var session: GHSession
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
    // MARK: OVERRIDE FUNCTIONS FROM [MiscellaneousReateLimitRepo]
    //__________________________________________________________________________________________________________________
    
    func get(result: @escaping ResultRateLimit) {
            result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousRateLimitRepo.get: 🚧 Not Implemented")))
    }
    
}




