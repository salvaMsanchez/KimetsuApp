//
//  Version.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

struct Version: Decodable {
    let current: String
    let needsUpdate: Bool
    let live: String
}
