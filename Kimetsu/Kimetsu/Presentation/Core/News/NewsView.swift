//
//  NewsView.swift
//  Kimetsu
//
//  Created by Salva Moreno on 10/3/24.
//

import SwiftUI

struct NewsView: View {
    // MARK: - Properties
    @EnvironmentObject private var routeViewModel: RouteViewModel
    @EnvironmentObject private var sessionViewModel: SessionViewModel
    @StateObject private var newsViewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if newsViewModel.isLoading {
                    ProgressView()
                } else {
                    List {
                        ForEach(newsViewModel.news, id: \.id) { news in
                            NewsItem(news: news)
                        }
                    }
                }
            }
            .task {
                try? await newsViewModel.fetchAllNews()
            }
            .listStyle(.plain)
            .navigationTitle(Text("news_news"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sessionViewModel.logOut()
                        routeViewModel.screen = .signIn
                    } label: {
                        Image(.rectanglePortraitAndArrowRight)
                    }
                }
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        let routeViewModel = RouteViewModel()
        routeViewModel.tab = .news
        return TabsView()
            .environmentObject(routeViewModel)
    }
}
