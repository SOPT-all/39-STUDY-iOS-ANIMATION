//
//  CarouselViewModel.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/26/26.
//

import SwiftUI
import Observation

@Observable
final class InfinityCarouselViewModel {
    private let sources = ["carousel1", "carousel2", "carousel3", "carousel4", "carousel5"]
    let items: [CarouselItem]
    var currentID: Int?
    private var isAutoScrolling = false

    init() {
        let looped = Array(sources.suffix(1)) + sources + Array(sources.prefix(1))
        items = looped.enumerated().map { CarouselItem(id: $0.offset, imageName: $0.element) }
        currentID = 1
    }

    func adjustIfNeeded() {
        guard !isAutoScrolling, let currentID else { return }
        if currentID == 0 {
            self.currentID = items.count - 2
        } else if currentID == items.count - 1 {
            self.currentID = 1
        }
    }
    
    var pageCount: Int { sources.count }
    
    var currentPage: Int {
        guard let currentID else { return 1 }
        switch currentID {
        case 0:
            return sources.count
        case items.count - 1:
            return 1
        default:
            return currentID
        }
    }
    
    var pageText: String { "\(currentPage) / \(pageCount)" }
        
    func moveToNext() {
        guard let currentID else { return }
        isAutoScrolling = true

        withAnimation(.easeInOut(duration: 0.4)) {
            self.currentID = currentID + 1
        } completion: {
            self.isAutoScrolling = false
            self.adjustIfNeeded()
        }
    }
    
}
