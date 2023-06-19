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
    @Binding var showingCallOutBinding: Bool
    /* actualizacion sobre combine conecta un objeto y actualiza la vsita y vicebersa*/

    var body: some View {
        VStack {
            Text("Latitud: \(annotation.coordinate.latitude)")
            Text("Longitud: \(annotation.coordinate.longitude)")
            Text("Cantidad de astronautas: \(astronauts.count)")
            ForEach(astronauts, id: \.name) { astronaut in
                Text("Nombre: \(astronaut.name)")
            }
            Button {
                $showingCallOutBinding.wrappedValue = false /* obligatorio usar un . Por otro lado wrappedValue es una propiedad de Binding que te permite acceder y modificar el valor  de la variable a la que está vinculado el Binding.*/
            } label: {
                Text("X")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .clipShape(Circle())
                    
            }

        }
        .padding()
        .background(Color.white)
        .shadow(radius: 10)
    }
}
