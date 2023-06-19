//
//  CallOut.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 19/6/23.
//

import Foundation
import SwiftUI

struct CalloutView: View {
    let annotation: ISSAnnotation
    let astronauts: [Astronaut]

    var body: some View {
        VStack {
            Text("Latitud: \(annotation.coordinate.latitude)")
            Text("Longitud: \(annotation.coordinate.longitude)")
            Text("Cantidad de astronautas: \(astronauts.count)")
            ForEach(astronauts, id: \.name) { astronaut in
                Text("Nombre: \(astronaut.name)")
            }
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 10)
    }
}
