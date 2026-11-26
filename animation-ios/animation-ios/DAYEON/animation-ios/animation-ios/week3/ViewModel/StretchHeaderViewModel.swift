//
//  StretchHeaderViewModel.swift
//  animation-ios
//
//  Created by dayeon on 11/26/26.
//

import Observation

enum ProfileTab: String, CaseIterable, Identifiable {
    case posts = "게시글"
    case likes = "좋아요"
    case saved = "저장"

    var id: Self { self }
}

@Observable
final class StretchHeaderViewModel {
    let headerImageName = "header"
    var selectedTab: ProfileTab = .posts

    private let itemsByTab: [ProfileTab: [String]] = [
        .posts: (1...30).map { "게시글 \($0)" },
        .likes: (1...20).map { "좋아요한 글 \($0)" },
        .saved: (1...25).map { "저장한 글 \($0)" }
    ]

    /// 선택된 탭의 리스트 데이터
    var currentItems: [String] {
        itemsByTab[selectedTab] ?? []
    }
}
