//
//  LiftTrackerApp.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/13/26.
//

import SwiftUI
import SwiftData

@main
struct LiftTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [
            MuscleGroup.self,
            Machine.self,
            Lift.self
        ])
    }
}
