//
//  AddLiftView.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/18/26.
//

import SwiftUI
import SwiftData

struct AddLiftView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var vm:LifterViewModel = LifterViewModel()
    var muscleGroups:[MuscleGroup]
    var machineName:String
    var muscleGroup:String
    
    @State var weight:Double = 0.0
    @State var reps:Int = 0
    @State var date:Date = Date()
    @State var errorMsg:String = ""
    @State var added:Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Lift Details")) {
                DatePicker("Lift Date", selection: $date)
                    .datePickerStyle(.compact)
                    .bold()
                Text("Lift (in Lbs):")
                    .bold()
                TextField("", value: $weight, format: .number)
                    .keyboardType(.decimalPad)
                Stepper("Number of Reps: \(reps)", value: $reps, in: 0...Int.max)
            }
        }
        
        Text("\(errorMsg)")
            .bold()
            .foregroundStyle(added == false ? .red : .green)
        Button(action: addNewLift) {
            Text("Add Lift")
        }
        .buttonStyle(.borderedProminent)
    }
    
    func addNewLift(){
        do{
            try vm.addLift(muscleGroups: muscleGroups, date: date, weight: weight, machineName: machineName, reps: reps, muscleGroup: muscleGroup)
            modelContext.insert(Lift(weight: weight, numReps: reps, date: date))
            added = true
            errorMsg = "Lift added!"
            dismiss()
        }catch addError.noWeight{
            added = false
            errorMsg = "Cannot add lift. Lift must be greater than 0 lbs"
        }catch addError.noReps{
            added = false
            errorMsg = "Cannot add lift. Reps must be greater than 0"
        }catch{
            added = false
            errorMsg = "Cannot add lift. Unknown error."
        }
    }
}

