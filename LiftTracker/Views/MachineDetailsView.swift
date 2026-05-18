//
//  MachineDetailsView.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/15/26.
//

import SwiftUI
import Charts

struct MachineDetailsView: View {
    var muscleGroups: [MuscleGroup]
    var machine:Machine
    
    var body: some View{
        Form{
            Section(header: Text("\(machine.name)")){
                Text("Your Progress")
                    .bold()
                    .font(.title)
                Chart{
                    ForEach(machine.lifts){ lift in
                        PointMark(
                            x: .value("Date", lift.date),
                            y: .value("Weight", lift.weight)
                        ).annotation(position: .top, alignment: .center) {
                            Text("\(lift.weight.formatted(.number.precision(.fractionLength(1))))")
                                .font(.caption)
                        }
                    }
                }
                .chartXAxisLabel("Lift Date")
                .chartYAxisLabel("Lift Weight (in Lbs)")
                .aspectRatio(contentMode: .fit)
                .padding()
                Text(machine.name)
                    .bold()
                Text("Muscle Group: \(machine.muscleGroup)")
                    .bold()
                Text("Starting Date: \(machine.firstDate.formatted())")
                    .bold()
            }
        }
        NavigationLink("Add Lift") {
            AddLiftView(muscleGroups:muscleGroups, machineName: machine.name, muscleGroup: machine.muscleGroup)
        }
        .buttonStyle(.borderedProminent)
    }
}

