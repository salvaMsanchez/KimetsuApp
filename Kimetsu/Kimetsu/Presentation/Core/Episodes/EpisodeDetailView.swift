//
//  EpisodesDetailView.swift
//  Kimetsu
//
//  Created by Salva Moreno on 11/3/24.
//

import SwiftUI

struct EpisodeDetailView: View {
    // MARK: - Properties -
    private let id: String
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var episodesViewModel = EpisodesViewModel()
    @State private var episode: Episode.Full?
    
    // MARK: - Init -
    init(id: String) {
        self.id = id
    }
    
    // MARK: - Main -
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if episodesViewModel.isLoading {
                ProgressView()
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    AsyncImage(url: episode?.fullImageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: { }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(episode?.title ?? "")
                                .font(.title)
                                .bold()
                         
                            Text(episode?.formattedDate ?? "")
                                .font(.subheadline)
                                .foregroundColor(.main)
                                .padding(8)
                                .background(Color(.systemGroupedBackground))
                                .cornerRadius(6)
                        }
                        
                        Text(episode?.summary ?? "")
                        
                        VStack(alignment: .center, spacing: 12) {
                            Text("episode_detail_characters")
                                .textCase(.uppercase)
                                .font(.headline)
                                .foregroundColor(.main)
                            
                            let characters = episode?.characters.compactMap { $0.name }.joined(separator: ", ") ?? ""
                            Text(characters)
                                .font(.subheadline)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(6)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .task {
            episode = try? await episodesViewModel.fetchEpisode(id: self.id)
        }
        .navigationTitle(Text("Cap. \(episode?.episodeNumber ?? 0)"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.chevronBackward)
                }
            }
        }
    }
}

struct EpisodesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(id: "123")
    }
}
