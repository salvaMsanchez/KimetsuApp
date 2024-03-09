//
//  KimetsuApp.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import SwiftUI

@main
struct KimetsuApp: App {
    // MARK: - Properties
    @StateObject var routeViewModel = RouteViewModel()
    
    // MARK: - Main
    var body: some Scene {
        WindowGroup {
            RouteView()
                .environmentObject(routeViewModel)
        }
    }
}
