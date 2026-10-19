//
//  GanadiKeyframeView.swift
//  animation-ios
//
//  Created by dayeon on 10/19/26.
//


import SwiftUI

struct GanadiValues {
    var offset: CGSize = .zero
    var angle: Angle = .zero
    var scale: CGFloat = 1
}

struct GanadiKeyframeView: View {
    @State private var trigger = 0

    var body: some View {
        VStack(spacing: 40) {
            Image(.ganadi)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .keyframeAnimator(initialValue: GanadiValues(), trigger: trigger) { content, value in
                    content
                        .scaleEffect(value.scale)
                        .rotationEffect(value.angle)
                        .offset(value.offset)
                } keyframes: { _ in
                    // 이동: 1초씩 네 꼭짓점을 돌고 제자리로
                    KeyframeTrack(\.offset) {
                        LinearKeyframe(CGSize(width: 100, height: 100), duration: 1)
                        LinearKeyframe(CGSize(width: 100, height: -100), duration: 1)
                        LinearKeyframe(CGSize(width: -100, height: -100), duration: 1)
                        LinearKeyframe(CGSize(width: -100, height: 100), duration: 1)
                        LinearKeyframe(.zero, duration: 1)
                    }

                    // 회전: 이동하는 동안 한 바퀴
                    KeyframeTrack(\.angle) {
                        LinearKeyframe(.degrees(360), duration: 4)
                        LinearKeyframe(.zero, duration: 0)
                    }

                    // 크기: 커졌다가 원래대로
                    KeyframeTrack(\.scale) {
                        SpringKeyframe(2, duration: 2)
                        SpringKeyframe(1, duration: 3)
                    }
                }

            Button("시작") {
                trigger += 1
            }
        }
    }
}

#Preview {
    GanadiKeyframeView()
}
