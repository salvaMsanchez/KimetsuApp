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
                SplashView()
            case .signIn:
                SignInView()
            case .tabs:
                TabsView()
        }
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView()
            .environmentObject(RouteViewModel())
    }
}
