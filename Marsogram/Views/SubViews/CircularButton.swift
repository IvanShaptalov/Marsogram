//
//  CircularButton.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import Foundation
import SwiftUI

struct CircularButton: View {
    let action: () -> Void
    let imageName: String
    let buttonColor: Color
    let imageColor: Color
    let size: CGFloat

    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size * 0.5, height: size * 0.5)
                .foregroundColor(imageColor)
                .padding()
                .background(buttonColor)
                .clipShape(Circle())
                .shadow(radius: 10)
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    CircularButton(
                action: { print("Button tapped") },
                imageName: "camera.fill",
                buttonColor: .orange,
                imageColor: .white,
                size: 70
            )
}
