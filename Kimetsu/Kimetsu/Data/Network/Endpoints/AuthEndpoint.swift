//
//  AuthEndpoint.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

enum AuthEndpoint {
    case signIn(email: String, password: String)
    case signUp(name: String, email: String, password: String)
}

extension AuthEndpoint: Endpoint {
    var baseURLString: String {
        URLs.api
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/auth/signin"
        case .signUp:
            return "/auth/signup"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    var method: HTTPMethod {
        switch self {
        case .signIn:
            return .get
            
        case .signUp:
            return .post
        }
    }
    
    var headers: HTTPHeaders? {
        var headers = HTTPHeaders()
        headers.add(name: "Kimetsu-ApiKey", value: URLs.apiKey)
        
        if case .signIn(let email, let password) = self {
            headers.add(.authorization(username: email, password: password))
        }
        
        return headers
    }
    
    var parameters: [String : Any]? {
        if case .signUp(let name, let email, let password) = self {
            return [
                "name": name,
                "email": email,
                "password": password
            ]
        }
        
        return nil
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
