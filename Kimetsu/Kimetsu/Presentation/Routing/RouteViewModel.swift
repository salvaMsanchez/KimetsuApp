//
//  RouteViewModel.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import SwiftUI

final class RouteViewModel: ObservableObject {
    // MARK: - Properties
    @Published var screen: RoutingStatus.Screen = .splash
    @Published var tab: RoutingStatus.Tab = .news
}
