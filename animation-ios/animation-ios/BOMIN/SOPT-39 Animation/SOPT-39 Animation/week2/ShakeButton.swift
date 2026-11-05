//
//  ShakeButton.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/5/26.
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
    offsetY = 10
} completion: {
    withAnimation(.spring(response: 0.3, dampingFraction: 0.1)) {
        offsetY = 0
    }
}
    }
}

#Preview {
    ShakeButton()
}
