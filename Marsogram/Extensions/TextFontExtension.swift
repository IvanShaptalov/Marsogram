//
//  TextFontExtension.swift
//  Marsogram
//
//  Created by PowerMac on 30.08.2024.
//
import SwiftUI

extension Text {
    func styledAsLargeTitle() -> some View {
        self.font(AppFonts.largeTitle)
            .lineSpacing(41 - 34)
            .multilineTextAlignment(.leading)
    }

    func styledAsTitle2() -> some View {
        self.font(AppFonts.title2)
            .lineSpacing(28 - 22)
            .multilineTextAlignment(.leading)
    }

    func styledAsBody2() -> some View {
        self.font(AppFonts.body2)
            .lineSpacing(22 - 17)
            .multilineTextAlignment(.leading)
    }

    func styledAsBody() -> some View {
        self.font(AppFonts.body)
            .lineSpacing(21 - 16)
            .multilineTextAlignment(.leading)
    }
}
