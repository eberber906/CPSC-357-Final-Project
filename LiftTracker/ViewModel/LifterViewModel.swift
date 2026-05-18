//
//  LifterViewModel.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/16/26.
//

import Foundation
import Observation
internal import Combine

enum addError: Error{
    case noName
    case noMuscleGroup
    case noWeight
    case noReps
    case repeated
}

@Observable
class LifterViewModel{
    
    func addMachine(muscleGroups:[MuscleGroup], muscleGroup:String, machineName:String, firstDate:Date, firstLift:Double, reps:Int) throws {
        if(muscleGroup == ""){
            throw addError.noMuscleGroup
        }
        if(machineName == ""){
            throw addError.noName
        }
        if(firstLift <= 0){
            throw addError.noWeight
        }
        if(reps <= 0){
            throw addError.noReps
        }
        
        for (index, group) in muscleGroups.enumerated() {
            if(group.name == muscleGroup){
                for (_, machine) in muscleGroups[index].machines.enumerated(){
                    if(machine.name == machineName){
                        throw addError.repeated
                    }
                }
                muscleGroups[index].machines.append(Machine(name: machineName, muscleGroup: muscleGroup, firstDate: firstDate, lifts: [Lift(weight: firstLift, numReps: reps, date: firstDate)]))
            }
        }
    }
    
    func addLift(muscleGroups:[MuscleGroup], date:Date, weight:Double, machineName:String, reps:Int, muscleGroup:String) throws{
        if(weight <= 0){
            throw addError.noWeight
        }
        if(reps <= 0){
            throw addError.noReps
        }
        
        for (index, group) in muscleGroups.enumerated() {
            if(group.name == muscleGroup){
                for (index1, machine) in muscleGroups[index].machines.enumerated(){
                    if(machine.name == machineName){
                        muscleGroups[index].machines[index1].lifts.append(Lift(weight: weight, numReps: reps, date: date))
                        muscleGroups[index].machines[index1].lifts.sort{$0.date < $1.date}
                    }
                }
            }
        }
    }
}
