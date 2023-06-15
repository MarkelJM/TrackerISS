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
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: viewModel.issAnnotations.first?.coordinate ?? CLLocationCoordinate2D(), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), annotationItems: viewModel.issAnnotations) { annotation in
            MapAnnotation(coordinate: annotation.coordinate) {
                ISSAnnotationView()
            }
        }
        .onAppear() {
            viewModel.fetchISSLocation()
        }
    }
}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
