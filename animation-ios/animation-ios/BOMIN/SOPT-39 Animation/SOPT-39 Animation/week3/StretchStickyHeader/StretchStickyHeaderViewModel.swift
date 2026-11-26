//
//  StretchStickyHeaderViewModel.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/26/26.
//

import SwiftUI
import Observation

@Observable
final class StretchStickyHeaderViewModel {
    let headerImageName = "header"
    var selectedTab: StretchStickyHeaderTab = .posts

    private let itemsByTab: [StretchStickyHeaderTab: [String]] = [
        .posts: (1...30).map { "📄게시글 \($0)" },
        .likes: (1...20).map { "❤️좋아요한 글 \($0)" },
        .saved: (1...10).map { "🔖저장한 글 \($0)" }
    ]

    var currentItems: [String] {
        itemsByTab[selectedTab] ?? []
    }

    func select(_ tab: StretchStickyHeaderTab) {
        selectedTab = tab
    }
}
