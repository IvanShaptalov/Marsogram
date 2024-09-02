//
//  DateFormatExtension.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import Foundation


extension Date {
    func toFormattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: self)
    }
}
