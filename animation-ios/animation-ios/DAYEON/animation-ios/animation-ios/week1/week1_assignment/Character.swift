//
//  Character.swift
//
//
//  Created by dayeon on 11/24/26.
//

import SwiftUI

struct CharacterValues {
    var offset: CGSize = .zero
    var angle: Angle = .zero
    var scale: CGFloat = 1
}

struct Character: View {
    let image: ImageResource
    let size: CGSize
    let isRunning: Bool
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size.width, height: size.height)
            .keyframeAnimator(initialValue: CharacterValues(), repeating: isRunning) { [isRunning] content, value in
                content
                    .scaleEffect(isRunning ? value.scale : 1)
                    .rotationEffect(isRunning ? value.angle : .zero)
                    .offset(isRunning ? value.offset : .zero)
            } keyframes: { _ in
                KeyframeTrack(\.offset) {
                    LinearKeyframe(CGSize(width: -100, height: -80), duration: 1)
                    LinearKeyframe(CGSize(width: 100, height: 70), duration: 1)
                    LinearKeyframe(CGSize(width: -100, height: -80), duration: 1)
                    LinearKeyframe(CGSize(width: 100, height: 70), duration: 1)
                    LinearKeyframe(CGSize(width: 0, height: 0), duration: 1)
                }
                
                KeyframeTrack(\.angle) {
                    LinearKeyframe(.degrees(1800), duration: 5)
                }
                
                KeyframeTrack(\.scale) {
                    SpringKeyframe(1, duration: 1)
                    SpringKeyframe(2, duration: 1)
                    SpringKeyframe(1, duration: 1)
                    SpringKeyframe(2, duration: 1)
                    SpringKeyframe(1, duration: 1)
                }
            }
    }
}
