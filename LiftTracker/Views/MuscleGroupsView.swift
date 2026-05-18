//
//  MuscleGroupsView.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/15/26.
//

import SwiftUI
import SwiftData

struct MuscleGroupsView: View {
    var muscleGroups:[MuscleGroup]
    
    var body: some View {
        NavigationStack {
            ZStack{
                List {
                     ForEach(muscleGroups) { group in
                         NavigationLink{
                             MachineListView(muscleGroups: muscleGroups, muscleGroup: group)
                         }label:{
                             ListCell(group:group)
                         }
                    }
                }
                .navigationTitle("Muscle Groups")
            }
        }
    }
}

struct ListCell:View{
    var group:MuscleGroup
    
    var body: some View{
        HStack{
            Image(systemName: "\(group.imageName)")
                .font(.system(size: 40))
                .foregroundStyle(Color.blue)
            Spacer()
            Text("\(group.name) (\(group.machines.count))")
                .font(.title2)
                .bold()
        }
    }
}

