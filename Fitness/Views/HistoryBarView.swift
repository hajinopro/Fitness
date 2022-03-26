//
//  HistoryBarView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/26.
//

import SwiftUI

struct HistoryBarView: View {
    @EnvironmentObject var history: HistoryStore
    @State private var days: [Date] = []
    @State private var exercisesForWeek: [ExerciseDay] = []
    @State private var countsForWeek: [Int] = []
    
    let maxBarHeight: Int = 300
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    ForEach(0..<7) { index in
                        VStack {
                            Spacer()
                            ZStack {
                                if countsForWeek.count > 0 {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: CGFloat(countsForWeek[index]))
                                        .padding(3)
                                        .foregroundColor(Color("background"))
                                        .shadow(
                                            color: Color("drop-highlight"),
                                            radius: 4,
                                            x: -4,
                                            y: -4)
                                        .shadow(
                                            color: Color("drop-shadow"),
                                            radius: 4,
                                            x: 4,
                                            y: 4)
                                    RoundedRectangle(cornerRadius: 6)
                                        .frame(height: CGFloat(countsForWeek[index]))
                                        .padding(12)
                                        .foregroundColor(Color("history-bar"))
                                } else {
                                    EmptyView()
                                }
                            }
                            Text(Date().lastSevenDays()[index].formatted(as: "EEE"))
                                .font(.caption)
                            Text(Date().lastSevenDays()[index].formatted(as: "MMM dd"))
                                .font(.caption)
                        }
                    }
                }
                Divider()
                Spacer()
            }
            .onAppear {
                days = Date().lastSevenDays()
                exercisesForWeek = Array(history.exerciseDays.prefix(7))
                let counts: [Int] = days.map { day in
                    let foundDate = exercisesForWeek.filter {
                        $0.date.yearMonthDay == day.yearMonthDay
                    }
                    return foundDate.first?.exercises.count ?? 0
                }
                assert(counts.count == 7)
                
                let maxValue = max(counts.max() ?? 0, 1)
                countsForWeek = counts.map {
                    $0 * maxBarHeight / maxValue
                }
            }
            .frame(height: geometry.size.height * 0.7)
            .padding()
        }
    }
}

struct HistoryBarView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryBarView()
            .environmentObject(HistoryStore(devData: true))
    }
}
