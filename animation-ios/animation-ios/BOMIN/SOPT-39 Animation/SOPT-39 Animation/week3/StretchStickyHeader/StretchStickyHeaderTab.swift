//
//  StretchStickyHeaderTab.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/26/26.
//

import Foundation

enum StretchStickyHeaderTab: String, CaseIterable, Identifiable {
    case posts = "게시글"
    case likes = "좋아요"
    case saved = "저장"

    var id: Self { self }
}
