//
//  LoginViewModel.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 13/6/23.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    var didTapStartButton = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupBindings()
    }

    private func setupBindings() {
        didTapStartButton
            .sink { [weak self] in
                self?.navigateToMap()
            }
            .store(in: &cancellables) //'.store(in: &cancellables) se asegura de que la suscripción se mantenga en memoria hasta que ya no sea necesaria.
    }

    private func navigateToMap() {
        // Aquí debes implementar la lógica para navegar a la siguiente vista (MapView).
    }
}
