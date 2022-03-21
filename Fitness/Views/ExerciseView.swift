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
    @EnvironmentObject var history: HistoryStore
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Could't find \(Exercise.exercises[index].videoName)")
                        .foregroundColor(.red)
                }
                HStack(spacing: 150) {
                    Button("Start Exercise") {
                        showTimer.toggle()
                    }
                    Button("Done") {
                        history.addDoneExercise(Exercise.exercises[index].exerciseName)
                        if lastExercise {
                            showSuccess.toggle()
                        } else {
                            selectedTab += 1
                        }
                    }
                    .disabled(!timerDone)
                    .sheet(isPresented: $showSuccess) {
                        SuccessView(selectedTab: $selectedTab)
                    }
                }
                .font(.title3)
                .padding()
                if showTimer {
                    TimerView(timerDone: $timerDone)
                }
                Spacer()
                RatingView(exerciseIndex: index)
                    .padding()
                Button("History") { showHistory.toggle() }
                    .sheet(isPresented: $showHistory, content: {
                        HistoryView(showHistory: $showHistory)
                    })
                .padding(.bottom)
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


