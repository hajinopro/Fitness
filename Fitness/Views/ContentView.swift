//
//  ContentView.swift
//  Fitness
//
//  Created by 하진호 on 2022/02/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                WelcomeView()
                ForEach(0..<4) { index in
                    ExerciseView(index: index)
                }
                Text("Excise2")
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
