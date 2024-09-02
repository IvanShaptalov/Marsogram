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
    @Published var viewPhotoCoordinator: ViewPhotoCoordinator?
    
    private func createHomeCoordinator() -> HomeCoordinator {
        let data = HomeScreenData(
            titleData: TitleData(title: "Home"),
            customMessageData: CustomMessageData(customMessage: "Welcome to the Home Screen"),
            marsPhotos: [
                MarsPhoto(rover: "Curiosity", camera: "Front Hazard Avoidance Camera", date: "June 6, 2019", imageName: "mars1"),
                MarsPhoto(rover: "Opportunity", camera: "Panoramic Camera", date: "July 18, 2018", imageName: "mars2"),
                MarsPhoto(rover: "Spirit", camera: "Navigation Camera", date: "March 3, 2010", imageName: "mars3")
            ]
        )
        let coordinator = HomeCoordinator(data: data)
        coordinator.mainCoordinator = self
        return coordinator
    }
    
    private func createHistoryCoordinator() -> HistoryCoordinator {
        let data = HistoryScreenData(
            titleData: TitleData(title: "History"),
            historyData: HistoryData(historyItems: ["Item 1", "Item 2"])
        )
        let coordinator = HistoryCoordinator(data: data)
        coordinator.mainCoordinator = self
        return coordinator
    }
    
    private func createViewPhotoCoordinator(photo: MarsPhoto) -> ViewPhotoCoordinator {
        let data = ViewPhotoScreenData(
            titleData: TitleData(title: "View Photo"),
            photoData: PhotoData(photoName: photo.imageName)
        )
        let coordinator = ViewPhotoCoordinator(data: data)
        coordinator.mainCoordinator = self
        return coordinator
    }
    
    func showPhotoDetails(for photo: MarsPhoto) {
        viewPhotoCoordinator = createViewPhotoCoordinator(photo: photo)
        currentView = .viewPhoto
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
