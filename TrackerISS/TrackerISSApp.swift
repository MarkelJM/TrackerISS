//
//  TrackerISSApp.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 13/6/23.
//

import SwiftUI

@main
struct TrackerISSApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
            
        }
    }
}
