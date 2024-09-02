//
//  MarsPhoto.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//
import Foundation


struct MarsPhoto: Identifiable {
    let id = UUID()
    let rover: String
    let camera: String
    let date: String
    let imageName: String
}
