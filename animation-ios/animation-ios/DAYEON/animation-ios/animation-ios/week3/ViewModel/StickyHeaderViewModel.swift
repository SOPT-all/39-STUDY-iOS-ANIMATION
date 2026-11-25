//
//  StickyHeaderViewModel.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import Observation

@Observable
final class StickyHeaderViewModel {
    let headerTitle = "구독"
    let items = (1...30).map { "콘텐츠 \($0)" }
}
