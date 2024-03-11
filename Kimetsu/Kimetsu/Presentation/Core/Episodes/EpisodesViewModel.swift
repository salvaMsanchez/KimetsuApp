//
//  EpisodesViewModel.swift
//  Kimetsu
//
//  Created by Salva Moreno on 11/3/24.
//

import Foundation

@MainActor
final class EpisodesViewModel: ObservableObject {
    // MARK: - Properties -
    @Published var isLoading = false
    @Published var episodes = [Episode.List]()
    
    // MARK: - Functions -
    func fetchListEpisodes() async throws {
        isLoading = true
        defer { isLoading = false }
        
        episodes = try await EpisodesEndpoint
            .all
            .request(type: [Episode.List].self)
    }
    
    func fetchEpisode(id: String) async throws -> Episode.Full {
        isLoading = true
        defer { isLoading = false }
        
        return try await EpisodesEndpoint
            .episode(id: id)
            .request(type: Episode.Full.self)
    }
}
