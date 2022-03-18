//
//  SuccessView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/14.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedTofill(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("""
                    Good job conpleting all four exercises!
                    Remember tomorrow's another day.
                    So eat well and get some rest.
                    """)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            VStack {
                Spacer()
                Button("Continue") {
                    dismiss()
                    selectedTab = 9
                }
                .padding(.bottom)
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
