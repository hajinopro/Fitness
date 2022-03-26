//
//  TimerView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/16.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var timeRemaining = 3
    @Binding var timerDone: Bool
    let exerciseName: String
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("background")
                    .edgesIgnoringSafeArea(.all)
                circle(size: geometry.size)
                    .overlay(
                        GradientBackground()
                            .mask(circle(size: geometry.size))
                    )
                VStack {
                    Text(exerciseName)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    Spacer()
                    IndentView {
                        Text("\(timeRemaining)")
                            .font(.system(size: 90, design: .rounded))
                            .fontWeight(.heavy)
                            .frame(
                                minWidth: 180,
                                maxWidth: 200,
                                minHeight: 180,
                                maxHeight: 200)
                            .padding()
                            .onReceive(timer) { _ in
                                if self.timeRemaining > 0 {
                                    self.timeRemaining -= 1
                                } else {
                                    timerDone = true
                                }
                            }
                    }
                    Spacer()
                    RaisedButton(buttonText: "Done") {
                        dismiss()
                    }
                    .opacity(timerDone ? 1 : 0)
                    .disabled(!timerDone)
                    .padding(20)
                }
                .onAppear {
                    timerDone = false
                }
            }
        }
    }
    
    func circle(size: CGSize) -> some View {
        Circle()
            .frame(width: size.width, height: size.height)
            .position(x: size.width * 0.5, y: -size.width * 0.2)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerDone: .constant(false), exerciseName: "Step Up")
    }
}
