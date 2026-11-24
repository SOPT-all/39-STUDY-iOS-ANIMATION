//
//  ShakeLoginButton.swift
//  animation-ios
//
//  Created by dayeon on 11/24/26.
//

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var travel: CGFloat = 10
    var shakes: CGFloat = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: travel * sin(animatableData * .pi * shakes * 2),
                y: 0
            )
        )
    }
}

struct ShakeLoginButton: View {
    @State private var attempts = 0

    var body: some View {
        Button("로그인") {
            withAnimation(.linear(duration: 0.4)) {
                attempts += 1
            }
        }
        .modifier(ShakeEffect(animatableData: CGFloat(attempts)))
    }
}

#Preview {
    ShakeLoginButton()
}
