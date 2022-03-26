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
                .foregroundColor(.white)
                .fontWeight(.black)
            HStack {
                ForEach(0 ..< Exercise.exercises.count, id: \.self) { index in
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .opacity(index == selectedTab ? 0.5 : 0)
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 16, height: 16)
                            .onTapGesture {
                                selectedTab = index
                        }
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
