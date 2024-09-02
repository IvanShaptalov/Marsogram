//
//  ViewPhotoView.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import SwiftUI

struct ViewPhotoView: View {
    @ObservedObject var coordinator: ViewPhotoCoordinator
    
    @State private var scale: CGFloat = 1.0 
    @State private var lastScaleValue: CGFloat = 1.0

    var body: some View {
        ZStack(alignment: .topLeading) {
            GeometryReader { geometry in
                if let image = UIImage(named: coordinator.data.photoData.photoName) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(scale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    let delta = value / lastScaleValue
                                    lastScaleValue = value
                                    scale *= delta
                                }
                                .onEnded { _ in
                                    lastScaleValue = 1.0
                                }
                        )
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                } else {
                    // Placeholder
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.gray)
                        .foregroundColor(.white)
                }
            }
            .background(Color.black)
            .ignoresSafeArea(edges: .all)
            
            // Exit button
            Button(action: {
                coordinator.mainCoordinator?.navigateTo(.home)
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
                    .padding(10)
            }
            .padding(.leading, 16)
            .padding(.top, 16)
        }
    }
}


#Preview {
    ViewPhotoView(coordinator: MockViewPhotoCoordinator())
}
