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
    
    init(titleData: TitleData, customMessageData: CustomMessageData) {
        self.titleData = titleData
        self.customMessageData = customMessageData
    }
}
