//
//  AstronautsViewModel.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 17/6/23.
//

import Foundation
import Combine
/*
class AstronautsViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let apiService = APIService()

    @Published var astronauts: [Astronaut] = []

    func fetchAstronauts() {
        apiService.fetchAstronauts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] response in
                self?.astronauts = response.people
            }
            .store(in: &cancellables)
    }
}
*/
