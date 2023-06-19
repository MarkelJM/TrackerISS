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
    
    @State private var showingCallOut : Bool = false
    @State private var selectedAnnotation : ISSAnnotation?//puede que se esté llamando o no, por eso opcional
    

    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region, annotationItems: viewModel.issAnnotations) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    AnnotationButton(annotation: annotation, showingCallOut: showingCallOut, selectedAnnotation: selectedAnnotation, astronauts: viewModel.astronauts, selectedAnnotationBinding: $selectedAnnotation, showingCallOutBinding: $showingCallOut)
                }
            }
            .onAppear() {
                viewModel.fetchISSLocation()
            }
            .onChange(of: viewModel.issAnnotations) { annotations in
                DispatchQueue.main.async {
                    if let coordinate = annotations.first?.coordinate {
                        region.center = coordinate
                    }
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



///ANTES DEL ERROR
    /*
     var body: some View {
         ZStack{
             Map(coordinateRegion: .constant(MKCoordinateRegion(center: viewModel.issAnnotations.first?.coordinate ?? CLLocationCoordinate2D(), span: MKCoordinateSpan(latitudeDelta: 180, longitudeDelta: 180))), annotationItems: viewModel.issAnnotations) { annotation in
                 MapAnnotation(coordinate: annotation.coordinate) {
                     //añadimos callout en formato boton
                     Button(action: {
                         selectedAnnotation = annotation
                         showingCallOut = true
                     }) {
                         ISSAnnotationView()
                     }
                     // Aquí añadimo una 'capa' encima de la 'ISSAnnotationView'.
                     .overlay(
                         Group {
                             // Aquí estamos diciendo "si estamos supuestos a mostrar el 'callout' (es decir, si 'showingCallOut' es 'true') y la anotación seleccionada es la misma que esta anotación (es decir, esta es la anotación que el usuario ha pulsado)
                             if showingCallOut && selectedAnnotation == annotation {
                                 CalloutView(annotation: annotation, astronauts: viewModel.astronauts)
                             } else {
                                 EmptyView() //no mostramos nada si no estan las condiciones
                             }
                         }
                     )
                     
                     


                 }
             }
             .onAppear() {
                 viewModel.fetchISSLocation()
             }
             .onChange(of: viewModel.issAnnotations) { annotations in
                 DispatchQueue.main.async {
                     if let coordinate = annotations.first?.coordinate {
                         region.center = coordinate
                     }
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
     */
