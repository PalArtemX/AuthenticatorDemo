//
//  CredentialsLoginView.swift
//  AuthenticatorDemo
//
//  Created by Artem Paliutin on 16/04/2022.
//

import SwiftUI

struct CredentialsLoginView: View {
    @EnvironmentObject var authenticationVN: AuthenticationViewModel
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            // MARK: - background
            Color.colorTheme.background
                .ignoresSafeArea()
            
            VStack(spacing: 35.0) {
                TitleView()
            
                TextField("username", text: $username)
                SecureField("password", text: $password)
                
                PrimaryButtonView(showImage: false, text: "Login")
                    .onTapGesture {
                        authenticationVN.authenticateWithCredentials(username: username, password: password)
                    }
            }
            .padding()
        .textFieldStyle(.roundedBorder)
        }
    }
}










struct CredentialsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsLoginView()
            .environmentObject(AuthenticationViewModel())
    }
}
