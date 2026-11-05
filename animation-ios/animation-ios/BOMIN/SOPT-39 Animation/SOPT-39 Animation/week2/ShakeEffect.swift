//
//  ShakeEffect.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/5/26.
//

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var travel: CGFloat = 10      // 좌우로 움직이는 거리
    var shakes: CGFloat = 3       // 떨리는 횟수
    var animatableData: CGFloat   // 이 값이 애니메이션됨

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: travel * sin(animatableData * .pi * shakes * 2),
                y: 0
            )
        )
    }
}
