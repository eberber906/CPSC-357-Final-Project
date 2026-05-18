//
//  Machine.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/17/26.
//

import Foundation
import SwiftData

@Model
class Machine{
    var name:String
    var muscleGroup:String
    var firstDate:Date
    @Relationship(deleteRule: .cascade) var lifts:[Lift]
    
    init(name: String, muscleGroup: String, firstDate: Date, lifts: [Lift]) {
        self.name = name
        self.muscleGroup = muscleGroup
        self.firstDate = firstDate
        self.lifts = lifts
    }
}
