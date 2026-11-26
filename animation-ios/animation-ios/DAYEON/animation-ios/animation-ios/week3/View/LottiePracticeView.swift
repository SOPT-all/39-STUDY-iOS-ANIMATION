//
//  LottiePracticeView.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import SwiftUI
import Lottie

struct LottiePracticeView: View {
    var body: some View {
        LottieView(animation: .named("home"))
            .playing(loopMode: .loop)
            .animationSpeed(1.5)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    LottiePracticeView()
}
