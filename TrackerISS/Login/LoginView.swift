//
//  LoginView.swift
//  TrackerISS
//
//  Created by Markel Juaristi on 13/6/23.
//

import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State var isActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenido a la App de ISS Tracker")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: MapView(viewModel: MapViewModel()), isActive: $isActive) {
                    EmptyView()
                }
                .hidden()

                Button(action: {
                    viewModel.didTapStartButton.send()
                    self.isActive = true
                }) {
                    Text("Iniciar")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(appState: AppState()))
    }
}
