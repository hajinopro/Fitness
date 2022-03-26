//
//  RaisedButton.swift
//  Fitness
//
//  Created by 하진호 on 2022/03/21.
//

import SwiftUI

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 12)
            .background(
                !configuration.isPressed ?
                        AnyView(
                            Capsule()
                                .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
                                .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
                                .foregroundColor(Color("background"))
                        )
                        : AnyView(
                            Capsule()
                                .inset(by: -4)
                                .stroke(Color("background"), lineWidth: 8)
                                .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
                                .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
                                .foregroundColor(Color("background"))
                                .clipShape(Capsule())
                        )
            )
    }
}

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(buttonText)
                .raisedButtonTextStyle()
        }
        .buttonStyle(RaisedButtonStyle())
    }
}

struct RaisedButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RaisedButton(buttonText: "Get Started", action: { })
                .padding(20)
        }
        .background(Color("background"))
        .previewLayout(.sizeThatFits)
    }
}

extension Text {
    func raisedButtonTextStyle() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
    }
}
