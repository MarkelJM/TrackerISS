//
//  TrackerISSApp.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 13/6/23.
//

import SwiftUI

@main
struct TrackerISSApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            switch appState.page {
            case .login:
                LoginView(viewModel: LoginViewModel(appState: appState))
            case .map:
                MapView(viewModel: MapViewModel())
            }
        }
    }
}
