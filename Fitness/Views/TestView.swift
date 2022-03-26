//
//  TextView.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/25.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            Capsule()
                .shadow(color: Color("drop-shadow"), radius: 8, x: 6, y: 6)
                .shadow(color: Color("drop-highlight"), radius: 8, x: -6, y: -6)
                .foregroundColor(Color("background"))
            
            Capsule()
                .inset(by: -4)
                .stroke(Color.red, lineWidth: 8)
                .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
                .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
                .foregroundColor(Color("background"))
                .clipShape(Capsule())
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("background")
            TestView()
                .frame(width: 300, height: 100)
        }
        .frame(width: 350, height: 150)
        .previewLayout(.sizeThatFits)
    }
}
