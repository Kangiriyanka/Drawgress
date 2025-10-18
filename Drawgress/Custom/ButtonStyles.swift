//
//  ButtonStyles.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/09/24.
//

import Foundation
import SwiftUI


struct CameraButtonStyle: ButtonStyle {
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
     
                LinearGradient(
                    colors: [
                        color,
                        color.opacity(0.8)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .foregroundColor(.white)
            .bold()
            .clipShape(Capsule(style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
