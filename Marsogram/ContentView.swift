//
//  ContentView.swift
//  Marsogram
//
//  Created by PowerMac on 29.08.2024.
//

import SwiftUI
import CoreData
import Lottie

struct ContentView: View {
    @ObservedObject var coordinator: MainAppCoordinator
    
    var body: some View {
        ZStack {
            switch coordinator.currentView {
            case .home:
                if let homeCoordinator = coordinator.homeCoordinator {
                    HomeView(coordinator: homeCoordinator)
                }
            case .history:
                if let historyCoordinator = coordinator.historyCoordinator {
                    HistoryView(coordinator: historyCoordinator)
                }
            case .viewPhoto:
                if let viewPhotoCoordinator = coordinator.viewPhotoCoordinator {
                    ViewPhotoView(coordinator: viewPhotoCoordinator)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            SplashScreen()
                .ignoresSafeArea()

        }
    }
}

#Preview {
    ContentView(coordinator: MockMainAppCoordinator())
}
