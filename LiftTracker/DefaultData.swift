import Foundation
import SwiftData

struct DefaultData {
    static func fill(context: ModelContext) {
        do {
            let existingGroups = try context.fetch(FetchDescriptor<MuscleGroup>())

            if !existingGroups.isEmpty {
                print("yaya")
                return
            }
            
            let defaultGroups = [ "Arms", "Back", "Shoulders", "Chest", "Legs", "Core", "Other"]
            let defaultImages = ["figure.strengthtraining.traditional",
                                "figure.cooldown",
                                 "figure.strengthtraining.traditional",
                                 "figure.strengthtraining.traditional",
                                 "figure.cross.training",
                                 "figure.core.training",
                                 "figure"]
            
            for (index, group) in defaultGroups.enumerated() {
                let muscleGroup = MuscleGroup(name: group, machines: [], imageName: defaultImages[index])
                context.insert(muscleGroup)
            }

            try context.save()
            print("yay but a lot")
        }catch{
            print("Failed to load default data: \(error)")
        }
    }
}
