//
//  LottiePracticeView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/26/26.
//

import SwiftUI
import Lottie

struct LottiePracticeView: View {
    var body: some View {
        LottieView(animation: .named("Christmas Snow Loading"))
            .playing(loopMode: .loop)
            .animationSpeed(1.5)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    LottiePracticeView()
}
