//
//  MapViewModel.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 14/6/23.
//

import Foundation
import Combine

class MapViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let apiService = APIService()

    // Propiedades para almacenar los datos
    @Published var issLocation: ISSLocationResponse?

    func fetchISSLocation() {
        apiService.fetchISSLocation()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] response in
                self?.issLocation = response
            }
            .store(in: &cancellables)
    }
}
