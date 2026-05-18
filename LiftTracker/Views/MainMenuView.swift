//
//  MainMenu.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/13/26.
//

import SwiftUI

struct MainMenuView: View {
    var muscleGroups:[MuscleGroup]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("LIFTER")
                    .background(Color.primary)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom)
                HStack{
                    Image(systemName: "gym.bag.fill")
                        .font(.system(size: 50))
                        .padding(.bottom)
                }
                Text("Let's lift those weights!")
                    .font(.title3)
                    .bold()
                    .padding(.bottom)
                NavigationLink("My Lifts") {
                    MuscleGroupsView(muscleGroups: muscleGroups)
                }
                .buttonStyle(.borderedProminent)
            } .toolbar{
                ToolbarItem(placement: .bottomBar){
                    NavigationLink{
                        PresentationCard()
                    }label:{
                        Text("Presentation Card")
                            //.font(.largeTitle)
                    }.buttonStyle(.automatic)
                }
            }
        }
    }
}
