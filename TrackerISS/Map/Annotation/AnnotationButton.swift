//
//  AnnotationButton.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 19/6/23.
//

import SwiftUI
import CoreLocation

struct AnnotationButton: View {
    let annotation: ISSAnnotation
    let showingCallOut: Bool
    let selectedAnnotation: ISSAnnotation?
    let astronauts: [Astronaut] 

    @Binding var selectedAnnotationBinding: ISSAnnotation?
    @Binding var showingCallOutBinding: Bool

    var body: some View {
        Button(action: {
            self.selectedAnnotationBinding = annotation
            self.showingCallOutBinding = true
        }) {
            ISSAnnotationView()
        }
        .overlay(
            Group {
                if showingCallOut && selectedAnnotation == annotation {
                    CalloutView(annotation: annotation, astronauts: astronauts, showingCallOutBinding: $showingCallOutBinding)
                        .frame(width: 400, height: 500)
                } else {
                    EmptyView()
                }
            }
        )

    }
}


struct AnnotationButton_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationButton(
            annotation: ISSAnnotation( coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)), // Esto es solo un ejemplo
            showingCallOut: false,
            selectedAnnotation: nil,
            astronauts: [Astronaut(craft: "Ejemplo", name: "Ejemplo")],
            selectedAnnotationBinding: .constant(nil),
            showingCallOutBinding: .constant(false)
        )
    }
}


