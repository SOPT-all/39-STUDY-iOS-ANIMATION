//
//  ShakeLoginbutton.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/5/26.
//

import SwiftUI

struct ShakeLoginButton: View {
    @State private var attempts = 0

    var body: some View {
        Button("로그인") {
            withAnimation(.linear(duration: 0.4)) {
                attempts += 1   // 0 → 1로 바뀌는 동안 sin 곡선으로 좌우 진동
            }
        }
        .modifier(ShakeEffect(animatableData: CGFloat(attempts)))
    }
}
#Preview {
    ShakeLoginButton()
}
