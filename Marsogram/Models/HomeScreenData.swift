//
//  HomeScreenData.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import Foundation


class HomeScreenData {
    let titleData: TitleData
    let customMessageData: CustomMessageData
    let marsPhotos: [MarsPhoto] 
    
    init(titleData: TitleData, customMessageData: CustomMessageData, marsPhotos: [MarsPhoto]) {
        self.titleData = titleData
        self.customMessageData = customMessageData
        self.marsPhotos = marsPhotos
    }
}
