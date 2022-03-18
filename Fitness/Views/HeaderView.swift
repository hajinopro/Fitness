//
//  HeaderView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/13.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    let titleText: String
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
                ForEach(0 ..< Exercise.exercises.count, id: \.self) { index in
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(fill)")
                        .onTapGesture {
                            selectedTab = index
                        }
                }
            }
            .font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(selectedTab: .constant(0), titleText: "Squat")
                .previewLayout(.sizeThatFits)
            HeaderView(selectedTab: .constant(1), titleText: "Step Up")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityExtraLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
