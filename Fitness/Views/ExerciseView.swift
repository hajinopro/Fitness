//
//  ExerciseView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/13.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let index: Int
    let timeInterval: TimeInterval = 30
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Could't find \(videoNames[index])")
                        .foregroundColor(.red)
                }
                Text(Date().addingTimeInterval(timeInterval), style: .timer)
                    .font(.system(size: 90))
                Button("Start/Done") {}
                .font(.title3)
                .padding()
                RatingView()
                    .padding()
                Spacer()
                Button("History") {}
                .padding(.bottom)
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 0)
    }
}


