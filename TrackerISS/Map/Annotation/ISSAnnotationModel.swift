//
//  ISSAnnotationModel.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 15/6/23.
//

import Foundation
import MapKit

struct ISSAnnotation: Identifiable {
    // ISSAnnotation cumple con el protocolo Identifiable, que es necesario para usar con Map. Nuevas actualizaciones
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
