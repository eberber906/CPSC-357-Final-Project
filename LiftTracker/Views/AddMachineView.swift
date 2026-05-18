//
//  AddMachineView.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/15/26.
//

import SwiftUI
import SwiftData

struct AddMachineView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var vm:LifterViewModel = LifterViewModel()
    var muscleGroups: [MuscleGroup]
    
    
    @State var name:String = ""
    @State var muscleGroup:String = ""
    @State var firstWeight:Double = 0.0
    @State var firstReps:Int = 0
    @State var firstDate:Date = Date()
    @State var errorMsg:String = ""
    @State var added:Bool = false
    
    let groups = ["Arms", "Back", "Shoulders", "Chest", "Legs", "Core", "Other"]
    
    var body: some View {
        Form {
            Section(header: Text("Machine Details")) {
                //default album cover
                Image(systemName: "gym.bag.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                TextField("Enter Machine Name", text: $name)
                Picker("Muscle Group", selection: $muscleGroup) {
                    ForEach(groups, id: \.self) { group in
                        Text(group).tag(group)
                    }
                }
                DatePicker("Start Date", selection: $firstDate)
                    .datePickerStyle(.compact)
                    .bold()
                Text("First Lift (in Lbs):")
                    .bold()
                TextField("First Lift (in Lbs):", value: $firstWeight, format: .number)
                    .keyboardType(.decimalPad)
                Stepper("Number of Reps: \(firstReps)", value: $firstReps, in: 0...Int.max)
            }
        }
        Text("\(errorMsg)")
            .bold()
            .foregroundStyle(added == false ? .red : .green)
        Button(action: addNewMachine) {
            Text("Add Machine")
        }
        .buttonStyle(.borderedProminent)
    }
    
    func addNewMachine(){
        do{
            try vm.addMachine(muscleGroups: muscleGroups, muscleGroup: muscleGroup, machineName: name, firstDate: firstDate, firstLift: firstWeight, reps: firstReps)
            modelContext.insert(Machine(name: name, muscleGroup: muscleGroup, firstDate: firstDate, lifts: [Lift(weight: firstWeight, numReps: firstReps, date: firstDate)]))
            errorMsg = "Machine added!"
            added = true
            dismiss()
        }catch addError.repeated{
            added = false
            errorMsg = "Cannot add machine again. \(name) already exists"
        }catch addError.noName{
            added = false
            errorMsg = "Cannot add machine. Please enter a name"
        }catch addError.noMuscleGroup{
            added = false
            errorMsg = "Cannot add machine. Please select a muscle group."
        }catch addError.noWeight{
            added = false
            errorMsg = "Cannot add machine. First lift must be greater than 0 lbs"
        }catch addError.noReps{
            added = false
            errorMsg = "Cannot add machine. Reps must be greater than 0"
        }catch{
            added = false
            errorMsg = "Cannot add machine. Unknown error."
        }
    }
}

