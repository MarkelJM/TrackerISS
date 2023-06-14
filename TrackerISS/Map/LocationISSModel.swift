//
//  LocationISSModel.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 14/6/23.
//

import Foundation


struct ISSLocationResponse: Codable {
    struct ISSPosition: Codable {
        let latitude: String
        let longitude: String
    }
    let timestamp: Int
    let iss_position: ISSPosition
    let message: String
}
