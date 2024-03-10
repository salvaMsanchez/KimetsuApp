//
//  TabsView.swift
//  Kimetsu
//
//  Created by Salva Moreno on 10/3/24.
//

import SwiftUI

struct TabsView: View {
    // MARK: - Properties -
    @EnvironmentObject private var routeViewModel: RouteViewModel
    
    // MARK: - Main -
    var body: some View {
        TabView(selection: $routeViewModel.tab) {
            NewsView()
                .tabItem {
                    Label(
                        "tab_news",
                        systemImage: Image.Symbol.newspaper.rawValue
                    )
                }
                .tag(RoutingStatus.Tab.news)
            
            EpisodesView()
                .tabItem {
                    Label(
                        "tab_episodes",
                        systemImage: Image.Symbol.booksVertical.rawValue
                    )
                }
                .tag(RoutingStatus.Tab.episodes)
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
            .environmentObject(RouteViewModel())
    }
}
