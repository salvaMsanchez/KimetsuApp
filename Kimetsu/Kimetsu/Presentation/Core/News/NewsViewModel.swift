//
//  NewsViewModel.swift
//  Kimetsu
//
//  Created by Salva Moreno on 11/3/24.
//

import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
    // MARK: - Properties -
    @Published var isLoading = false
    @Published var news = [News]()
    
    // MARK: - Functions -
    func fetchAllNews() async throws {
        isLoading = true
        defer { isLoading = false }
        
        news = try await NewsEndpoint
            .all
            .request(type: [News].self)
    }
}
