//
//  AuthenticatorDemoApp.swift
//  AuthenticatorDemo
//
//  Created by Artem Paliutin on 16/04/2022.
//

import SwiftUI

@main
struct AuthenticatorDemoApp: App {
    @StateObject var authenticationVN = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(authenticationVN)
        }
    }
}
