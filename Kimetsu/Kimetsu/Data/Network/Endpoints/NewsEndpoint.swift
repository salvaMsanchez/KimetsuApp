//
//  NewsEndpoint.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

enum NewsEndpoint {
    case all
}

extension NewsEndpoint: Endpoint {
    var baseURLString: String {
        URLs.api
    }
    
    var path: String {
        "/news"
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: HTTPHeaders? {
        var headers = HTTPHeaders()
        headers.add(.init(name: "CDS-ApiKey", value: URLs.apiKey))
        
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
