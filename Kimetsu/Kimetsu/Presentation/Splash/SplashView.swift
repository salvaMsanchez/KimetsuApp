//
//  SplashView.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import SwiftUI

struct SplashView: View {
    // MARK: - Properties -
    @EnvironmentObject private var routeViewModel: RouteViewModel
    @EnvironmentObject private var sessionViewModel: SessionViewModel
    
    @StateObject private var splashViewModel = SplashViewModel()
    @State private var showAlert = false
    
    // MARK: - Main -
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.gradientTop, .gradientBottom],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 60)
                    .padding(.horizontal, 32)
                
                Spacer()
                
                Text(splashViewModel.currentVersion)
                    .font(.callout)
                    .foregroundColor(Color(.systemBackground))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            
            Image("tanjiro")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .offset(x: 10)
        }
        .task {
            do {
                try await Task.sleep(nanoseconds: 2_000_000_000)
                try await splashViewModel.checkIfNeedsUpdate()
            } catch {
                routeViewModel.screen = .tabs
            }
        }
        .onChange(of: splashViewModel.needsUpdate) { newValue in
            if newValue == true {
                showAlert = true
            } else {
                if sessionViewModel.isValidSession {
                    routeViewModel.screen = .tabs
                } else {
                    routeViewModel.screen = .signIn
                }
            }
        }
        .alert("new_update", isPresented: $showAlert) {
            Button("open_app_store") {
                if let url = URL(string: URLs.appStore) {
                    UIApplication.shared.open(url)
                }
            }
        } message: {
            Text("new_update_message")
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(RouteViewModel())
            .environmentObject(SessionViewModel())
    }
}
