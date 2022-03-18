//
//  FitnessApp.swift
//  Fitness
//
//  Created by 하진호 on 2022/02/27.
//

import SwiftUI

@main
struct FitnessApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
                }
        }
    }
}
