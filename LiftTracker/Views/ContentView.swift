//
//  ContentView.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/13/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \MuscleGroup.name) var muscleGroups:[MuscleGroup]
    
    var body: some View {
        MainMenuView(muscleGroups: muscleGroups)
            .onAppear(){
                DefaultData.fill(context: modelContext)
            }
    }
}

#Preview {
    ContentView()
}
