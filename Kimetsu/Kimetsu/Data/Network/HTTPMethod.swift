//
//  HTTPMethod.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

/// Supported HTTP methods
public enum HTTPMethod: String {
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
}
