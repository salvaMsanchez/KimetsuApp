//
//  EpisodesEndpoint.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

enum EpisodesEndpoint {
    case all
    case episode(id: String)
}

extension EpisodesEndpoint: Endpoint {
    var baseURLString: String {
        URLs.api
    }
    
    var path: String {
        switch self {
        case .all:
            return "/episodes"
            
        case .episode(let id):
            return "/episodes/\(id)"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: HTTPHeaders? {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "CDS-ApiKey", value: URLs.apiKey))
        
        let token = (UserDefaults.standard.object(forKey: URLs.accessToken) as? String) ?? ""
        headers.add(.authorization(bearerToken: token))
        
        return headers
    }
    
    var parameters: [String : Any]? {
        nil
    }
    
    var body: Data? {
        nil
    }
    
    var parameterEncoding: ParameterEncoding {
        .JSONEncoding
    }
    
    var showDebugInfo: Bool {
        #if DEBUG
        true
        #else
        false
        #endif
    }
}
