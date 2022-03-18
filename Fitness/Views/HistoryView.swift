//
//  HistoryView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/14.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistroyStore
    @Binding var showHistory: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: { showHistory.toggle() } ) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding(.trailing)
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section {
                            ForEach(day.exercises, id: \.self) { exercise in
                                Text(exercise)
                            }
                        } header: {
                            Text(day.date.formatted(as: "MMM dd"))
                                .font(.headline)
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .environmentObject(HistroyStore())
    }
}
