//
//  MapView.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 15/6/23.
//

import SwiftUI
import Combine
import MapKit

struct MapView: View {
    @ObservedObject var viewModel = MapViewModel()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(),
        // Establecemos un span grande para ver más del mundo
        span: MKCoordinateSpan(latitudeDelta: 180, longitudeDelta: 180)
    )


    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: viewModel.issAnnotations.first?.coordinate ?? CLLocationCoordinate2D(), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), annotationItems: viewModel.issAnnotations) { annotation in
            MapAnnotation(coordinate: annotation.coordinate) {
                ISSAnnotationView()
            }
        }
        .onAppear() {
            viewModel.fetchISSLocation()
        }
        .onChange(of: viewModel.issAnnotations) { annotations in
                    if let coordinate = annotations.first?.coordinate {
                        region.center = coordinate
                    }
                }
    }
}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
