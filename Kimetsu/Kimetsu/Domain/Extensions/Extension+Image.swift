//
//  Extension+Image.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import SwiftUI

extension Image {
    enum Symbol: String {
        // SF Symbol
        case xmarkCircleFill = "xmark.circle.fill"
        case personCircleFill = "person.circle.fill"
        case envelopeCircleFill = "envelope.circle.fill"
        case lockCircleFill = "lock.circle.fill"
        case newspaper
        case booksVertical = "books.vertical"
        case rectanglePortraitAndArrowRight = "rectangle.portrait.and.arrow.right"
        case chevronBackward = "chevron.backward"
    }
}

extension Image {
    init(_ symbol: Image.Symbol) {
        self.init(systemName: symbol.rawValue)
    }
}
