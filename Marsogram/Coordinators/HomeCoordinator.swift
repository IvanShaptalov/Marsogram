//
//  HomeCoordinator.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import Foundation
import SwiftUI


class HomeCoordinator: ObservableObject {
    weak var mainCoordinator: MainAppCoordinator?
    @Published var data: HomeScreenData

    init(data: HomeScreenData) {
        self.data = data
    }

    func updateData(with customMessage: String) {
        self.data = HomeScreenData(
            titleData: TitleData(title: self.data.titleData.title),
            customMessageData: CustomMessageData(customMessage: customMessage),
            marsPhotos: self.data.marsPhotos
        )
    }
}


