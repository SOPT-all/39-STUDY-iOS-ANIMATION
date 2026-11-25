//
//  LoadingState.swift
//  animation-ios
//
//  Created by dayeon on 11/26/26.
//


//
//  LottieLoadingViewModel.swift
//  animation-ios
//
//  Created by dayeon on 11/26/26.
//

import Observation

enum LoadingState {
    case idle       // 대기
    case loading    // 로딩 중
    case completed  // 완료
}

@MainActor
@Observable
final class LottieLoadingViewModel {
    var state: LoadingState = .idle

    /// 로딩 중에는 버튼 비활성화
    var isButtonDisabled: Bool {
        state == .loading
    }

    /// 2초 로딩 흉내
    func load() async {
        guard state != .loading else { return }
        state = .loading
        try? await Task.sleep(for: .seconds(2))
        state = .completed
    }
}