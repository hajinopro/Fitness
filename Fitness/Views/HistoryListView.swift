//
//  HistoryListView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/25.
//

import SwiftUI

struct HistoryListView: View {
    @EnvironmentObject var history: HistoryStore
    
    var body: some View {
        ScrollView {
            ForEach(history.exerciseDays) { day in
                Section {
                    HStack(spacing: 40) {
                        ForEach(0..<(min(day.exercises.count, 4)), id: \.self) { index in
                            let exercise = day.exercises[index]
                            VStack {
                                IndentView {
                                    switch exercise {
                                    case "Squat":
                                        Image(systemName: "bolt.fill")
                                            .frame(minWidth: 60)
                                    case "Step Up":
                                        Image(systemName: "arrow.uturn.up")
                                            .frame(minWidth: 60)
                                    case "Burpee":
                                        Image(systemName: "hare.fill")
                                            .frame(minWidth: 60)
                                    default:
                                        Image(systemName: "sun.max.fill")
                                            .frame(minWidth: 60)
                                    }
                                }
                                .foregroundColor(Color("exercise-history"))
                                .padding(.bottom, 20)
                                Text(exercise)
                                    .font(.caption)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                } header: {
                    HStack {
                        Text(day.date.formatted(as: "MMM dd"))
                            .font(.headline)
                            .padding()
                        Spacer()
                    }
                } footer: {
                    Divider()
                }
            }
        }
    }
}


struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView()
            .environmentObject(HistoryStore(devData: true))
    }
}
