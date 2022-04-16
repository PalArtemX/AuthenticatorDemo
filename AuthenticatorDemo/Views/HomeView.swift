//
//  HomeView.swift
//  AuthenticatorDemo
//
//  Created by Artem Paliutin on 16/04/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authenticationVN: AuthenticationViewModel
    
    var body: some View {
        VStack {
            if authenticationVN.isAuthenticated {
                VStack {
                    TitleView()
                    Text("Welcome!")
                    Button("Logout") {
                        authenticationVN.logout()
                    }
                    .padding(.horizontal)
                    .buttonStyle(.bordered)
                    .foregroundColor(.red)
                }
            } else {
                LoginView()
            }
            
        }
        .alert(isPresented: $authenticationVN.showAlert) {
            Alert(title: Text("Error"), message: Text(authenticationVN.errorDescription ?? "Error trying to login with credentials, please try again"), dismissButton: .default(Text("OK")))
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthenticationViewModel())
    }
}
