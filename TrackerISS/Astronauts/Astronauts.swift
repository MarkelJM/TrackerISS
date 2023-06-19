//
//  Astronauts.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 17/6/23.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id = UUID()
    let craft: String
    let name: String
}

struct AstronautsAPIResponse: Codable {
    let message: String
    let number: Int
    let people: [Astronaut]
}
