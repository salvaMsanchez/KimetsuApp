//
//  Buttons.swift
//  Kimetsu
//
//  Created by Salva Moreno on 10/3/24.
//

import SwiftUI

struct LoadingButton: ButtonStyle {
    // MARK: - Properties -
    @Binding var isLoading: Bool
    
    // MARK: - Override -
    func makeBody(configuration: Configuration) -> some View {
        if isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .tint(Color(.label))
                .padding()
        } else {
            configuration.label
        }
    }
}
