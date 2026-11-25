//
//  LottieLoadingView.swift
//  animation-ios
//
//  Created by dayeon on 11/26/26.
//

import SwiftUI
import Lottie

struct LottieLoadingView: View {
    @State private var viewModel = LottieLoadingViewModel()

    var body: some View {
        VStack(spacing: 32) {
            animationArea
                .frame(width: 200, height: 200)

            Button {
                Task {
                    await viewModel.load()
                }
            } label: {
                Text(viewModel.isButtonDisabled ? "로딩 중..." : "불러오기")
                    .frame(width: 160, height: 48)
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isButtonDisabled)
        }
    }

    /// 상태에 따라 어떤 로띠를 보여줄지만 고름
    @ViewBuilder
    private var animationArea: some View {
        switch viewModel.state {
        case .idle:
            Image(systemName: "arrow.down.circle")
                .font(.system(size: 60))
                .foregroundStyle(.secondary)

        case .loading:
            LottieView(animation: .named("loading"))
                .playing(loopMode: .loop)

        case .completed:
            LottieView(animation: .named("complete"))
                .playing(loopMode: .playOnce)
        }
    }
}

#Preview {
    LottieLoadingView()
}