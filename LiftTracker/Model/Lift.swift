//
//  Lift.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/17/26.
//

import Foundation
import SwiftData

@Model
class Lift{
    var weight:Double
    var numReps:Int
    var date:Date
    
    init(weight: Double, numReps: Int, date: Date) {
        self.weight = weight
        self.numReps = numReps
        self.date = date
    }
}
