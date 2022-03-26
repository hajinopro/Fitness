//
//  HistoryView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/14.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryStore
    @Environment(\.dismiss) private var dismiss
    @State private var layout: LayoutType = .list
    
    enum LayoutType {
        case list, bar
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: { dismiss() } ) {
                Image(systemName: "xmark")
            }
            .font(.title)
            .padding([.top, .trailing])
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                HStack {
                    if layout == .list {
                        Button {
                            layout = .bar
                        } label: {
                            Image(systemName: "square.grid.2x2.fill")
                                .padding([.leading, .trailing], 20)
                        }
                        .buttonStyle(EmbossedButtonStyle())
                        
                        Button {
                            layout = .bar
                        } label: {
                            Image(systemName: "chart.bar.fill")
                                .padding([.leading, .trailing], 20)
                                .foregroundColor(.gray)
                        }
                    } else {
                        Button {
                            layout = .list
                        } label: {
                            Image(systemName: "square.grid.2x2.fill")
                                .padding([.leading, .trailing], 20)
                                .foregroundColor(.gray)
                        }
                        
                        Button {
                            layout = .list
                        } label: {
                            Image(systemName: "chart.bar.fill")
                                .padding([.leading, .trailing], 20)
                        }
                        .buttonStyle(EmbossedButtonStyle())
                    }
                }
                if layout == .list {
                    HistoryListView()
                } else {
                    HistoryBarView()
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(HistoryStore(devData: true))
    }
}

