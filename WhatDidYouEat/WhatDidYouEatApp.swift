//
//  WhatDidYouEatApp.swift
//  WhatDidYouEat
//
//  Created by Zhencheng Chen on 4/27/22.
//

import SwiftUI
import Firebase

@main
struct WhatDidYouEatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}
