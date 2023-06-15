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
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(viewModel.issLocation?.iss_position.latitude ?? "0") ?? 0, longitude: CLLocationDegrees(viewModel.issLocation?.iss_position.longitude ?? "0") ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))))
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
