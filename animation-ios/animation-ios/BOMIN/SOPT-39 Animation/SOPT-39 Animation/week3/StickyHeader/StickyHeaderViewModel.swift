//
//  StickyHeaderViewModel.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/26/26.
//

import SwiftUI

import Observation

@Observable
final class StickyHeaderViewModel {
    let headerTitle = "달라붙을거임"
    let items = (1...30).map { "콘텐츠 \($0)" }
}
