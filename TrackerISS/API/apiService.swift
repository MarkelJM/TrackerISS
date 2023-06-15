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
        let urlString = URL(string: "http://api.open-notify.org/iss-now.json")!

        let url = URLSession.shared.dataTaskPublisher(for: urlString)
            .map(\.data)
            .decode(type: ISSLocationResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return url
    }
}
