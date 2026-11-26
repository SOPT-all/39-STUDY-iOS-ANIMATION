//
//  ShakeButton.swift
//  animation-ios
//
//  Created by dayeon on 11/24/26.
//

import SwiftUI

struct ShakeButton: View {
    @State private var offsetY: CGFloat = 0

    var body: some View {
        Button("로그인") {
            shake()
        }
        .offset(y: offsetY)
    }

    private func shake() {
        withAnimation(.linear(duration: 0.01)) {
    offsetY = 20
} completion: {
    withAnimation(.spring(response: 0.3, dampingFraction: 0.2)) {
        offsetY = 0
    }
}
    }
}

#Preview {
    ShakeButton()
}
