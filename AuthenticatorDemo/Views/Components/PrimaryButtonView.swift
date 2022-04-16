//
//  PrimaryButtonView.swift
//  AuthenticatorDemo
//
//  Created by Artem Paliutin on 16/04/2022.
//

import SwiftUI

struct PrimaryButtonView: View {
    var image: String?
    var showImage = true
    var text: String
    
    var body: some View {
        HStack {
            if showImage {
                Image(systemName: image ?? "person.fill")
                    .symbolRenderingMode(.hierarchical)
            }
            
            Text(text)
        }
        .font(.headline)
        .padding()
        .padding(.horizontal)
        .background()
        .cornerRadius(20)
    }
}










struct PrimaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PrimaryButtonView(image: "faceid", text: "Login with FaceID")
                .previewLayout(.sizeThatFits)
            PrimaryButtonView(image: "faceid", text: "Login with FaceID")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
