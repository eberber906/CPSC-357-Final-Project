//
//  Machine.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/14/26.
//

import Foundation
import SwiftData

@Model
class MuscleGroup{
    var name: String
    @Relationship(deleteRule: .cascade)var machines:[Machine]
    var imageName:String
    
    init(name: String, machines: [Machine], imageName:String) {
        self.name = name
        self.machines = machines
        self.imageName = imageName
    }
}

