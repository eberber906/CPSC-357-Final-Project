//
//  PresentationCard.swift
//  LiftTracker
//
//  Created by Emiliano Berber on 5/18/26.
//

import SwiftUI

struct PresentationCard: View {
    @GestureState private var offset: CGSize = .zero
    @State var reps:Int = 0
    
    var body: some View {
        let drag = DragGesture()
            .updating($offset) { dragValue, state, transaction in
                state = dragValue.translation
            }
            .onEnded{_ in
                reps += 1
            }
        
        VStack{
            HStack{
                Image(systemName: "dumbbell")
                    .font(.system(size: 40))
                    .foregroundStyle(.blue)
                    .offset(offset)
                    .gesture(drag)
                Text("Reps: \(reps)")
                    .bold()
            }
            .padding(.bottom)
            Text("App Name: Lifter")
                .bold()
                .font(.largeTitle)
            Text("Made by Emiliano Berber")
            Text("\"Progressive overload\" is an important thing to keep track of in the gym if one wants to grow muscle. This app was inspired by a personal problem I had encountered as of late where I had no organized way of keeping track of my progress on the machines at my local gym. I had tried notes apps and notebooks but none felt very convenient. I asked some of my friends that also regularly go to the gym and they expressed similar issues. This app aims to be a convencience for gym-goers who want an organized way of keeping track of their weight-lifting progress.")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    PresentationCard()
}
