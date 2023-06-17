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
        span: MKCoordinateSpan(latitudeDelta: 100000, longitudeDelta: 100000)
    )


    
    var body: some View {
        ZStack{
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: viewModel.issAnnotations.first?.coordinate ?? CLLocationCoordinate2D(), span: MKCoordinateSpan(latitudeDelta: 180, longitudeDelta: 180))), annotationItems: viewModel.issAnnotations) { annotation in
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
            VStack{
                Spacer()
                Button {
                    viewModel.fetchISSLocation()
                } label: {
                    Text("Update ISS")
                        .padding()
                        .background(Color.blue)
                        .border(.white)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                 
                
                .padding()
            }
        }
    }
}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
