//
//  VersionEndpoint.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

enum VersionEndpoint {
    case needsUpdate(current: String)
}

extension VersionEndpoint: Endpoint {
    var baseURLString: String {
        URLs.api
    }
    
    var path: String {
        switch self {
        case .needsUpdate:
            return "/version"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .needsUpdate(let current):
            return [URLQueryItem(name: "current", value: current)]
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: HTTPHeaders? {
        HTTPHeaders([
            .init(name: "CDS-Apikey", value: URLs.apiKey)
        ])
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
