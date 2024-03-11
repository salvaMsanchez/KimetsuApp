//
//  EpisodesView.swift
//  Kimetsu
//
//  Created by Salva Moreno on 10/3/24.
//

import SwiftUI

struct EpisodesView: View {
    // MARK: - Properties -
    @EnvironmentObject private var routeViewModel: RouteViewModel
    @EnvironmentObject private var sessionViewModel: SessionViewModel
    @StateObject private var episodesViewModel = EpisodesViewModel()
    
    private let gridItems = [
        GridItem(.adaptive(minimum: 130), spacing: 20, alignment: .center),
        GridItem(.adaptive(minimum: 130), spacing: 20, alignment: .center)
    ]
    
    // MARK: - Main -
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 20) {
                    ForEach(episodesViewModel.episodes, id: \.id) { episode in
                        NavigationLink {
                            //EpisodeDetailView(id: episode.id)
                        } label: {
                            EpisodeItem(episode: episode)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
            }
            .task {
                try? await episodesViewModel.fetchListEpisodes()
            }
            .navigationTitle(Text("episodes_episodes"))
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

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        let routeViewModel = RouteViewModel()
        routeViewModel.tab = .episodes
        return TabsView()
            .environmentObject(routeViewModel)
    }
}
