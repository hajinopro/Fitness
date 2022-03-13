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
                Text("Welcome")
                    .tabItem {
                        Text("Welcome")
                    }
                Text("Excise1")
                    .tabItem {
                        Text("Excise1")
                    }
                Text("Excise2")
                    .tabItem {
                        Text("Excise2")
                    }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
