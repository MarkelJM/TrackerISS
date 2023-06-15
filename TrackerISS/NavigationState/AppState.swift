//
//  AppState.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 15/6/23.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var page: Page = .login

    enum Page {
        case login
        case map
    }
}

