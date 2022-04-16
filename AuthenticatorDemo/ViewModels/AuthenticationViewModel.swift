//
//  AuthenticationViewModel.swift
//  AuthenticatorDemo
//
//  Created by Artem Paliutin on 16/04/2022.
//

import Foundation
import LocalAuthentication


class AuthenticationViewModel: ObservableObject {
    private(set) var context = LAContext()
    private(set) var canEvaluatePolicy = false
    @Published private(set) var biometryType: LABiometryType = .none
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    // MARK: - init
    init() {
        getBiometryType()
    }
    
    // MARK: - Functions
    
    // MARK: getBiometryType
    func getBiometryType() {
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    // MARK: authenticateWithBiometrics
    func authenticateWithBiometrics() async {
        context = LAContext()
        
        if canEvaluatePolicy {
            let reason = "Log into your account"
            
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        print("isAuthenticated", self.isAuthenticated)
                    }
                }
            } catch  {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                    self.biometryType = .none
                }
            }
            
        }
    }
    
    
}
