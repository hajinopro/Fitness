//
//  HistoryStore.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/15.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistroyStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
    
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if today.isSameDay(as: exerciseDays[0].date) {
            print("Adding \(exerciseName)")
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
        }
    }
}


