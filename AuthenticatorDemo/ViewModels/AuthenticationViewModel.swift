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
    
    // MARK: - init
    init() {
        getBiometryType()
    }
    
    // MARK: - Functions
    
    // MARK: getBiometryType
    func getBiometryType() {
        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
}
