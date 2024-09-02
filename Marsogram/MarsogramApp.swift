//
//  MarsogramApp.swift
//  Marsogram
//
//  Created by PowerMac on 29.08.2024.
//

import SwiftUI

@main
struct MarsogramApp: App {
    @StateObject private var coordinator = MainAppCoordinator()

    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(coordinator: coordinator)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        
        return true
    }
}
