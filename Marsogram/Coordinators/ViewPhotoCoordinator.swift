//
//  ViewPhotoCoordinator.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import Foundation
import SwiftUI

class ViewPhotoCoordinator: ObservableObject {
    weak var mainCoordinator: MainAppCoordinator?
    @Published var data: ViewPhotoScreenData

    init(data: ViewPhotoScreenData) {
        self.data = data
    }

    func updateData(with photoName: String) {
        self.data = ViewPhotoScreenData(
            titleData: TitleData(title: self.data.titleData.title),
            photoData: PhotoData(photoName: photoName)
        )
    }
}
