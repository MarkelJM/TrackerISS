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

    var body: some View {
        VStack {
            Text("Bienvenido a la App de ISS Tracker")
                .font(.largeTitle)
                .padding()

            Button(action: {
                viewModel.didTapStartButton.send()
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
