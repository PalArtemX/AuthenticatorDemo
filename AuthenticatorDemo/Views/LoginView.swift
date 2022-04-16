//
//  LoginView.swift
//  AuthenticatorDemo
//
//  Created by Artem Paliutin on 16/04/2022.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authenticationVN: AuthenticationViewModel
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.colorTheme.background
                .ignoresSafeArea()
            
            VStack(spacing: 45.0) {
                // MARK: - Title
                TitleView()
                
                // MARK: - Button
                switch authenticationVN.biometryType {
                case .faceID:
                    PrimaryButtonView(image: "faceid", text: "Login with FaceID")
                        .onTapGesture {
                            Task.init {
                                await authenticationVN.authenticateWithBiometrics()
                            }
                            
                        }
                case .touchID:
                    PrimaryButtonView(image: "touchid", text: "Login with TouchID")
                        .onTapGesture {
                            Task.init {
                                await authenticationVN.authenticateWithBiometrics()
                            }
                            
                        }
                default:
                    PrimaryButtonView(image: "person", text: "Login with your credentials")
                }
            }
        }
    }
}









struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationViewModel())
    }
}
