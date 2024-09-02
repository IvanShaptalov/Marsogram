//
//  MockCoordinators.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import Foundation


class MockMainAppCoordinator: MainAppCoordinator {
    override init() {
        super.init()
        self.currentView = .home
    }
}

class MockHomeCoordinator: HomeCoordinator {
    init() {
        let mockData = HomeScreenData(
            titleData: TitleData(title: "Mock Home"),
            customMessageData: CustomMessageData(customMessage: "This is a mock home screen")
        )
        super.init(data: mockData)
    }
}

class MockHistoryCoordinator: HistoryCoordinator {
    init() {
        let mockData = HistoryScreenData(
            titleData: TitleData(title: "Mock History"),
            historyData: HistoryData(historyItems: ["Mock Item 1", "Mock Item 2"])
        )
        super.init(data: mockData)
    }
}

class MockViewPhotoCoordinator: ViewPhotoCoordinator {
    init() {
        let mockData = ViewPhotoScreenData(
            titleData: TitleData(title: "Mock View Photo"),
            photoData: PhotoData(photoName: "MockPhoto.jpg")
        )
        super.init(data: mockData)
    }
}
