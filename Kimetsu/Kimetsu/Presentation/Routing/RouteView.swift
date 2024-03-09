//
//  RouteView.swift
//  Kimetsu
//
//  Created by Salva Moreno on 9/3/24.
//

import SwiftUI

struct RouteView: View {
    // MARK: - Properties -
    @EnvironmentObject var routeViewModel: RouteViewModel
    
    var body: some View {
        switch routeViewModel.screen {
            case .splash:
                Text("Splash View")
            case .signIn:
                Text("Sign In View")
            case .tabs:
                Text("Tabs View")
        }
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView()
            .environmentObject(RouteViewModel())
    }
}
