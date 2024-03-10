//
//  SessionViewModel.swift
//  Kimetsu
//
//  Created by Salva Moreno on 10/3/24.
//

import SwiftUI

@MainActor
final class SessionViewModel: ObservableObject {
    // MARK: - Properties -
    @Published var isLoading = false
    @Published var isValidSession = false
    
    // MARK: - Init -
    init() {
        
    }
    
    // MARK: - Functions -
    private func checkSession() {
        guard let _ = UserDefaults.standard.object(forKey: URLs.accessToken) else {
            isValidSession = false
            return
        }
        
        isValidSession = true
    }
    
    func signIn(email: String, password: String) async throws {
        isLoading = true
        defer { isLoading = false }
        
        let tokens = try await AuthEndpoint
            .signIn(email: email, password: password)
            .request(type: SessionToken.self)
        
        UserDefaults.standard.setValue(tokens.accessToken, forKey: URLs.accessToken)
        UserDefaults.standard.setValue(tokens.refreshToken, forKey: URLs.refreshToken)
    }
    
    func signUp(name: String, email: String, password: String) async throws {
        isLoading = true
        defer { isLoading = false }
        
        let tokens = try await AuthEndpoint
            .signUp(name: name, email: email, password: password)
            .request(type: SessionToken.self)
        
        UserDefaults.standard.setValue(tokens.accessToken, forKey: URLs.accessToken)
        UserDefaults.standard.setValue(tokens.refreshToken, forKey: URLs.refreshToken)
    }
    
    func logOut() {
        UserDefaults.standard.removeObject(forKey: URLs.accessToken)
        UserDefaults.standard.removeObject(forKey: URLs.refreshToken)
    }
}
