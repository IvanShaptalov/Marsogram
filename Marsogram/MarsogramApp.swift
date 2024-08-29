//
//  MarsogramApp.swift
//  Marsogram
//
//  Created by PowerMac on 29.08.2024.
//

import SwiftUI

@main
struct MarsogramApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
