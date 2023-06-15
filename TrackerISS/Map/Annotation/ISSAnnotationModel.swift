//
//  ISSAnnotationModel.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 15/6/23.
//

import Foundation
import MapKit

struct ISSAnnotation: Identifiable, Equatable {
    // ISSAnnotation cumple con el protocolo Identifiable, que es necesario para usar con Map. Nuevas actualizaciones
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    
    // Para el .onChange del view:
    // Esta función compara dos objetos de tipo ISSAnnotation.
    // lhs (left hand side) es el objeto en el lado izquierdo del operador '=='
    // rhs (right hand side) es el objeto en el lado derecho del operador '=='
    // Aquí, decimos que dos objetos son iguales si sus latitudes y longitudes son iguales.
    
    static func ==(lhs: ISSAnnotation, rhs: ISSAnnotation) -> Bool {
        return lhs.coordinate.latitude == rhs.coordinate.latitude && lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}
