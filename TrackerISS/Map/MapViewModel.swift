//
//  MapViewModel.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 14/6/23.
//

import Foundation
import Combine
import MapKit


class MapViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let apiService = APIService()
    // Propiedades para almacenar los datos
    //@Published var issLocation: ISSLocationResponse?
    @Published var issAnnotations: [ISSAnnotation] = [] // este array permitirá almacenar múltiples anotaciones, si en el futuro necesitamos mostrar múltiples ubicaciones de la ISS a la vez
    @Published var astronauts = [Astronaut]()

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
                print("Coordinates fetched. Latitude: \(response.iss_position.latitude), Longitude: \(response.iss_position.longitude)")
                if let latitude = Double(response.iss_position.latitude),
                   let longitude = Double(response.iss_position.longitude) {
                    let annotation = ISSAnnotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                    self?.issAnnotations = [annotation]
                }
            }
            .store(in: &cancellables)
    }
}
