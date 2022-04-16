//
//  Color.swift
//  AuthenticatorDemo
//
//  Created by Artem Paliutin on 16/04/2022.
//

import Foundation
import SwiftUI


struct ColorTheme {
    let background = Color("Background")
}

extension Color {
    static var colorTheme = ColorTheme()
}
