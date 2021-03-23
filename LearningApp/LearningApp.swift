//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Cristian Guerra on 23/3/2564 BE.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
