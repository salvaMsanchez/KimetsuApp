//
//  EpisodeItem.swift
//  Kimetsu
//
//  Created by Salva Moreno on 11/3/24.
//

import SwiftUI

struct EpisodeItem: View {
    // MARK: - Properties -
    let episode: Episode.List
    
    // MARK: - Main -
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: episode.fullImageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150)
                        .cornerRadius(6)
                        .shadow(color: Color(.label).opacity(0.2), radius: 6, x: 1, y: 2)
                } placeholder: { }
            
                Text("\(episode.episodeNumber)")
                    .font(.caption2)
                    .bold()
                    .foregroundColor(.main)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(.systemBackground))
                    .cornerRadius(6)
                    .padding(2)
            }
            
            Text(episode.title)
                .font(.footnote)
                .foregroundColor(Color(.label))
        }
    }
}

struct EpisodeItem_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeItem(episode: .init(id: "123", episodeNumber: 09, title: "Preview Title", imageURL: nil))
            .padding()
            .previewLayout(.fixed(width: 200, height: 150))
    }
}
