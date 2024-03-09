//
//  SplashViewModel.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import Foundation

@MainActor
final class SplashViewModel: ObservableObject {
    // MARK: - Properties
    @Published var isLoading = false
    @Published var currentVersion = Bundle.main.shortVersion
    @Published var needsUpdate: Bool?
    
    // MARK: - Functions
    func checkIfNeedsUpdate() async throws {
        isLoading = true
        defer { isLoading = false }
        
        let version = try await VersionEndpoint
            .needsUpdate(current: currentVersion)
            .request(type: Version.self)
        
        needsUpdate = version.needsUpdate
        
    }
}
