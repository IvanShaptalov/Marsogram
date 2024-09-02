//
//  MarsPhotoCell.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import Foundation
import SwiftUI


struct MarsPhotoCell: View {
    let photo: MarsPhoto

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Rover:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text(" \(photo.rover)")
                    .font(.subheadline)
                    .bold()

                Text("Camera:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text(" \(photo.camera)")
                    .font(.subheadline)
                    .bold()

                Text("Date:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text(" \(photo.date)")
                    .font(.subheadline)
                    .bold()
            }

            Spacer()

            Image(photo.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)
        )
    }
}
