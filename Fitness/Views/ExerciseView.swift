//
//  ExerciseView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/13.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    let index: Int
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    @State private var showHistory = false
    @State private var showSuccess = false
    @State private var timerDone = false
    @State private var showTimer = false
    @State private var showSheet = false
    @EnvironmentObject var history: HistoryStore
    @State private var exerciseSheet: ExerciseSheet?
    
    enum ExerciseSheet {
        case history, success, timer
    }
    
    var startExerciseButton: some View {
        RaisedButton(buttonText: "Start Exercise") {
            showTimer = true
            showSheet = true
            exerciseSheet = .timer
        }
    }
    
    var historyButton: some View {
        EmbossedButton(buttonText: "History", action: {
            showHistory = true
            showSheet = true
            exerciseSheet = .history
        }, buttonShape: .capsule)
        .padding(.bottom)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
                Spacer()
                ContainerView {
                    VStack {
                        if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                            VideoPlayer(player: AVPlayer(url: url))
                                .frame(height: geometry.size.height * 0.25)
                                .padding()
                        } else {
                            Text("Could't find \(Exercise.exercises[index].videoName)")
                                .foregroundColor(.red)
                        }
                        
                        startExerciseButton
                            .padding(20)
                        
                        RatingView(exerciseIndex: index)
                            .padding()

                        Spacer()
                        historyButton
                    }
                }
                .frame(height: geometry.size.height * 0.8)
                .sheet(isPresented: $showSheet) {
                    showSuccess = false
                    showHistory = false
                    if exerciseSheet == .timer {
                        if timerDone {
                            history.addDoneExercise(Exercise.exercises[index].exerciseName)
                            timerDone = false
                        }
                        showTimer = false
                        if lastExercise {
                            showSuccess = true
                            showSheet = true
                            exerciseSheet = .success
                        } else {
                            selectedTab += 1
                        }
                    } else {
                        exerciseSheet = nil
                    }
                    showTimer = false
                } content: {
                    if let exerciseSheet = exerciseSheet {
                        switch exerciseSheet {
                        case .history:
                            HistoryView()
                                .environmentObject(history)
                        case .success:
                            SuccessView(selectedTab: $selectedTab)
                        case .timer:
                            TimerView(timerDone: $timerDone, exerciseName: Exercise.exercises[index].exerciseName)
                        }
                    }
                }
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(0), index: 0)
            .environmentObject(HistoryStore())
    }
}


