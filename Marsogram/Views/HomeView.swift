//
//  HomeVIew.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var coordinator: HomeCoordinator

    var body: some View {
        VStack {
            Text(coordinator.data.titleData.title)
                .font(.largeTitle)
                .padding()
            
            Text(coordinator.data.customMessageData.customMessage)
                .padding()
            
            Button("Go to History") {
                coordinator.mainCoordinator?.navigateTo(.history)
            }
            Button("Go to View Photo") {
                coordinator.mainCoordinator?.navigateTo(.viewPhoto)
            }
        }
    }
}


#Preview {
    HomeView(coordinator: MockHomeCoordinator())
}
