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
    public static let pathEmojis : String = "/emojis"
    
    
    
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
        
        /// initialize local variables
        
        let path : String = Self.pathEmojis
        
        
    
        self.session.get(path, with: nil) {
            RESTResult in
            
            switch (RESTResult) {
            
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
            
            case .success(let response) :
                do {
                
                    do  {
                        let emojis : [String:String] = try self.session.decoder.decode([String:String].self, from: response.data)
                        result(.success(emojis))
                        
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                }
                
            }

        }
            
    }
    
}


class GHMiscellaneousGitIgnoresRepo: MiscellaneousGitIgnoresRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    public static let pathGitignore : String  = "/gitignore"
    public static let pathTemplates : String  = "/templates"
    
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
        
        /// initialize local variables
        var path : String = Self.pathGitignore
        path += Self.pathTemplates
        
        /// execute http get request
        session.get(path, with: nil) {
            
            RESTResult in
            
            switch (RESTResult) {
            
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
            
            case .success(let response) :
                do {
                                    
                    do  {
                        let names : [String] = try self.session.decoder.decode([String].self, from: response.data)
                        
                        result(.success(names))
                        
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                }
                
            }
            
        }
        
    
    }

    
    func gitIgnoreTemplate(name: String, result: @escaping ResultGitIgnoreTemplate) {
        
        /// initialize local variables
        var path : String = Self.pathGitignore
        path += Self.pathTemplates
        path += "/\(name)"
                        
        /// execute http get request
        session.get(path, with: nil) {
            
            RESTResult in
            
            switch (RESTResult) {
            
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
            
            case .success(let response) :
                do {
                                    
                    do  {
                        
                        let template  = try self.session.decoder.decode(GHGitignoreTemplateEntity.self, from: response.data)
                        result(.success(template))
                        
                    } catch {
                        
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    
}

class GHMiscellaneousLicensesRepo: MiscellaneousLicensesRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    public static let pathLicenses : String  = "/licenses"
    public static let pathLicense  : String  = "/license"
    
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
        
        /// initialize local variables
        let  path : String = Self.pathLicenses
          
        /// execute http get request
        session.get(path, with: nil) {
            
            RESTResult in
            
            switch (RESTResult) {
            
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
            
            case .success(let response) :
                do {
                                    
                    do  {
                        let licenses = try self.session.decoder.decode([GHLicenseEntity].self, from: response.data)
                        
                        result(.success(licenses))
                        
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    func single(name: String, result: @escaping ResultGitLicense) {
        
        /// initialize local variables
        var  path : String = Self.pathLicenses
        path += "/\(name)"
        
        /// execute http get request
        session.get(path, with: nil) {
            
            RESTResult in
            
            switch (RESTResult) {
            
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
            
            case .success(let response) :
                do {
                                    
                    do  {
                        let license = try self.session.decoder.decode(GHLicenseEntity.self, from: response.data)
                        
                        result(.success(license))
                        
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                }
                
            }
            
        }

    }
    
    func licenseIn(owner: String, repo: String, result: @escaping ResultGitLicense) {
        
        // initialize local variables
        var  path : String = GHRepositoryRepository.pathRepos
        path        += "/\(owner)"
        path        += "/\(repo)"
        
        /// execute http get request
        session.get(path, with: nil) {
            
            RESTResult in
            
            switch (RESTResult) {
            
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
            
            case .success(let response) :
                do {
                                    
                    do  {
                        let license = try self.session.decoder.decode(GHLicenseEntity.self, from: response.data)
                        
                        result(.success(license))
                        
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                }
                
            }
            
        }
        
    }
    
}



class GHMiscellaneousMarkdownRepo: MiscellaneousMarkdownRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    private static let paramText    : String = "text"
    private static let paramMode    : String = "mode"
    private static let paramContext : String = "context"
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    public static let pathMarkdown  : String = "/markdown"
    public static let pathRaw       : String = "/raw"
    
    
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
        
        /// initializa local variables
        let path : String = Self.pathMarkdown
        let param : [String:Any] = [
            Self.paramText      : text,
            Self.paramMode      : "gfm",
            Self.paramContext   : "github/gollum"
            
        ]
        
        print("\t\t🌐\(path)")
        print("\t\t📜\(param)")
        
        /// execute http get request
        session.post(path, with: param) {
            
            RESTResult in
            
            switch (RESTResult) {
            
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
            
            case .success(let response) :
                do {
                                    
                    do  {
                        let render = try self.session.decoder.decode(String.self, from: response.data)
                        result(.success(render))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    func renderMarkdownRaw(text: String, result: @escaping ResultRender) {
        
        /// initializa local variables
        var path : String = Self.pathMarkdown
        path += Self.pathRaw
        print("\t\t🌐\(path)")
        
        /// execute http get request
        session.post(path, with: nil) {
            
            RESTResult in
            
            switch (RESTResult) {
            
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
            
            case .success(let response) :
                do {
                                    
                    do  {
                        let render = try self.session.decoder.decode(String.self, from: response.data)
                        result(.success(render))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

class GHMiscellaneousMetaRepo: MiscellaneousMetaRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    public static let pathMeta : String = "/meta"
    
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
        
        /// initializa local variables
        let path : String = Self.pathMeta
        
        /// execute http get request
        session.get(path, with: nil) {
            
            RESTResult in
            
            switch (RESTResult) {
            
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
            
            case .success(let response) :
                do {
                                    
                    do  {
                        let meta = try self.session.decoder.decode(GHMetaEntity.self, from: response.data)
                        result(.success(meta))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

class GHMiscellaneousRateLimitRepo: MiscellaneousRateLimitRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    public static let pathRateLimit : String  = "/rate_limit"
    
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
        
        /// initializa local variables
        let path : String = Self.pathRateLimit
        print("\t\t🌐\(path)")
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHMiscellaneousRateLimitRepo.get: 🚧 Not Implemented")))
    }
    
}




