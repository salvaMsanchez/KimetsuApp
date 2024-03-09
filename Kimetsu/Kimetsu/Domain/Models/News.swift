//
//  News.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

struct News: Decodable {
    let id: String
    let createdAt: Date
    let title: String
    let body: String
    var imageURL: String?
}

// MARK: - Auxiliar
extension News {
    var formattedDate: String {
        DateFormatter.localizedString(from: createdAt, dateStyle: .long, timeStyle: .none)
    }
    
    var fullImageURL: URL? {
        URL(string: URLs.images + (imageURL ?? ""))
    }
}
