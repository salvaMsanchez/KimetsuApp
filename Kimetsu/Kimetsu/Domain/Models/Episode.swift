//
//  Episode.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

struct Episode {
    struct List: Decodable {
        let id: String
        let episodeNumber: Int
        let title: String
        let imageURL: String?
    }
    
    struct Full: Decodable {
        let id: String
        let episodeNumber: Int
        let title: String
        let airedAt: Date
        let summary: String
        let imageURL: String?
        let characters: [Character]
    }
}

// MARK: - Auxiliar
extension Episode.List {
    var fullImageURL: URL? {
        URL(string: URLs.images + (imageURL ?? ""))
    }
}

extension Episode.Full {
    var formattedDate: String {
        DateFormatter.localizedString(from: airedAt, dateStyle: .full, timeStyle: .none)
    }
    
    var fullImageURL: URL? {
        URL(string: URLs.images + (imageURL ?? ""))
    }
}
