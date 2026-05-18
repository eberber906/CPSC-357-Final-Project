//
//  MachineList.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/15/26.
//

import SwiftUI

struct MachineListView: View {
    var muscleGroups:[MuscleGroup]
    var muscleGroup:MuscleGroup
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("\(muscleGroup.machines.count == 0 ? "Let's start adding some machines!":"")")
                    .foregroundStyle(.blue)
                    .bold()
                List {
                    ForEach(muscleGroup.machines) { machine in
                        NavigationLink{
                            MachineDetailsView(muscleGroups: muscleGroups, machine: machine)
                        }label: {
                            ListCell1(machine: machine, muscleGroup: muscleGroup)
                                .padding()
                        }
                    }.onDelete(perform: deleteItems)
                }
                .navigationTitle("Machines for \(muscleGroup.name)")
                .toolbar{
                    ToolbarItem(placement: .bottomBar){
                        NavigationLink{
                            AddMachineView(muscleGroups: muscleGroups)
                        }label:{
                            Text("Add Machine")
                                //.font(.largeTitle)
                        }.buttonStyle(.borderedProminent)
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        EditButton()
                    }
                }
            }
        }
    }
    
    //used to delete album from view
    func deleteItems(at offsets: IndexSet) {
        muscleGroup.machines.remove(atOffsets: offsets)
    }
}

struct ListCell1:View{
    var machine:Machine
    var muscleGroup:MuscleGroup
    
    var body: some View{
        HStack{
            Image(systemName: "\(muscleGroup.imageName)")
                .font(.system(size: 40))
            Text(machine.name)
                .font(.title2)
                .bold()
        }
    }
}

