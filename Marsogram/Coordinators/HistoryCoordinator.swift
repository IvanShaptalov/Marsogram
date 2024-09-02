//
//  HistoryCoordinator.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import Foundation
import SwiftUI

class HistoryCoordinator: ObservableObject {
    weak var mainCoordinator: MainAppCoordinator?
    @Published var data: HistoryScreenData

    init(data: HistoryScreenData) {
        self.data = data
    }

    func updateData(with historyItems: [String]) {
        self.data = HistoryScreenData(
            titleData: TitleData(title: self.data.titleData.title),
            historyData: HistoryData(historyItems: historyItems)
        )
    }
}
