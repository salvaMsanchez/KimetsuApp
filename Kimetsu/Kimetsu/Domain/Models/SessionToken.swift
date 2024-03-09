//
//  SessionToken.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

struct SessionToken: Decodable {
    let accessToken: String
    let refreshToken: String
}
