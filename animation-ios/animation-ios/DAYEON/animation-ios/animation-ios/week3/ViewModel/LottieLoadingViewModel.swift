//
//  LottieLoadingViewModel.swift
//  animation-ios
//
//  Created by dayeon on 11/26/26.
//

import Observation

enum LoadingState {
    case idle
    case loading
    case completed
}

@MainActor
@Observable
final class LottieLoadingViewModel {
    var state: LoadingState = .idle

    var isButtonDisabled: Bool {
        state == .loading
    }
    
    func load() async {
        guard state != .loading else { return }
        state = .loading
        try? await Task.sleep(for: .seconds(2))
        state = .completed
    }
}
