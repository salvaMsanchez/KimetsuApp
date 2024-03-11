//
//  NewsItem.swift
//  Kimetsu
//
//  Created by Salva Moreno on 11/3/24.
//

import SwiftUI

struct NewsItem: View {
    // MARK: - Properties -
    let news: News
    
    // MARK: - Main -
    var body: some View {
        HStack(spacing: 9) {
            AsyncImage(url: news.fullImageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(1/1, contentMode: .fit)
                    .frame(width: 120)
                    .clipped()
                    .cornerRadius(6)
            } placeholder: { }

            VStack(alignment: .leading, spacing: 6) {
                Text(news.title)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(2)
                
                Text(news.body)
                    .font(.caption)
                    .foregroundColor(Color(.systemGray))
                    .lineLimit(3)
                
                Spacer()
                
                Text(news.formattedDate)
                    .font(.footnote)
                    .foregroundColor(.main)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding(.vertical, 2)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(news: .init(id: "123", createdAt: .now, title: "News preview", body: "News preview body"))
            .previewLayout(.fixed(width: 380, height: 150))
    }
}
