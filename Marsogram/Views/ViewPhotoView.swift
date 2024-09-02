//
//  ViewPhotoView.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import SwiftUI

struct ViewPhotoView: View {
    @ObservedObject var coordinator: ViewPhotoCoordinator

    var body: some View {
        VStack {
            Text(coordinator.data.titleData.title)
                .font(.largeTitle)
                .padding()
            
            Text("Photo Name: \(coordinator.data.photoData.photoName)")
            
            Button("Go to Home") {
                coordinator.mainCoordinator?.navigateTo(.home)
            }
            Button("Go to History") {
                coordinator.mainCoordinator?.navigateTo(.history)
            }
        }
    }
}

#Preview {
    ViewPhotoView(coordinator: MockViewPhotoCoordinator())
}
