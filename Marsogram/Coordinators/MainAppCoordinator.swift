//
//  MainCoordinator.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import Foundation
import SwiftUI

import SwiftUI

class MainAppCoordinator: ObservableObject {
    @Published var currentView: MainView = .home
    
    lazy var homeCoordinator: HomeCoordinator? = self.createHomeCoordinator()
    lazy var historyCoordinator: HistoryCoordinator? = self.createHistoryCoordinator()
    lazy var viewPhotoCoordinator: ViewPhotoCoordinator? = self.createViewPhotoCoordinator()
    
    private func createHomeCoordinator() -> HomeCoordinator {
        let data = HomeScreenData(
            titleData: TitleData(title: "Home"),
            customMessageData: CustomMessageData(customMessage: "Welcome to the Home Screen")
        )
        let coordinator = HomeCoordinator(data: data)
        coordinator.mainCoordinator = self  // Устанавливаем ссылку на MainAppCoordinator
        return coordinator
    }
    
    private func createHistoryCoordinator() -> HistoryCoordinator {
        let data = HistoryScreenData(
            titleData: TitleData(title: "History"),
            historyData: HistoryData(historyItems: ["Item 1", "Item 2"])
        )
        let coordinator = HistoryCoordinator(data: data)
        coordinator.mainCoordinator = self  // Устанавливаем ссылку на MainAppCoordinator
        return coordinator
    }
    
    private func createViewPhotoCoordinator() -> ViewPhotoCoordinator {
        let data = ViewPhotoScreenData(
            titleData: TitleData(title: "View Photo"),
            photoData: PhotoData(photoName: "SamplePhoto.jpg")
        )
        let coordinator = ViewPhotoCoordinator(data: data)
        coordinator.mainCoordinator = self  // Устанавливаем ссылку на MainAppCoordinator
        return coordinator
    }
    
    func updateHomeCoordinator(with customMessage: String) {
        homeCoordinator?.updateData(with: customMessage)
    }
    
    func updateHistoryCoordinator(with historyItems: [String]) {
        historyCoordinator?.updateData(with: historyItems)
    }
    
    func updateViewPhotoCoordinator(with photoName: String) {
        viewPhotoCoordinator?.updateData(with: photoName)
    }
    
    func navigateTo(_ view: MainView) {
        currentView = view
    }
}



enum MainView {
    case home
    case history
    case viewPhoto
}
