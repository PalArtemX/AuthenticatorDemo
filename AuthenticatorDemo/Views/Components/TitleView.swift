//
//  TitleView.swift
//  AuthenticatorDemo
//
//  Created by Artem Paliutin on 16/04/2022.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Authenticator")
            .bold()
            .font(.title3)
    }
}










struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TitleView()
                .previewLayout(.sizeThatFits)
            TitleView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
