//
//  apiService.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 14/6/23.
//

import Foundation
import Combine

class APIService {
    func fetchISSLocation() -> AnyPublisher<ISSLocationResponse, Error> {
        let url = URL(string: "http://api.open-notify.org/iss-now.json")!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ISSLocationResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
