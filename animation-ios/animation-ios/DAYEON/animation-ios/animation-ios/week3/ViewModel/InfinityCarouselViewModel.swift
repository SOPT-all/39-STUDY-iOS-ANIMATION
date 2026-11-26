//
//  InfinityCarouselViewModel.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import Observation

@Observable
final class InfinityCarouselViewModel {
    private let sources = ["carousel1", "carousel2", "carousel3", "carousel4", "carousel5"]
    let items: [CarouselItem]
    var currentID: Int?

    var isAutoScrolling = false

    init() {
        let looped = Array(sources.suffix(1)) + sources + Array(sources.prefix(1))
        items = looped.enumerated().map { CarouselItem(id: $0.offset, imageName: $0.element) }
        currentID = 1
    }
    
    var currentPage: Int {
        guard let currentID else { return 1 }
        if currentID == 0 {
            return sources.count
        } else if currentID == items.count - 1 {
            return 1
        }
        return currentID
    }

    var pageText: String {
        "\(currentPage) / \(sources.count)"
    }

    func moveToNext() {
        let next = (currentID ?? 1) + 1
        currentID = min(next, items.count - 1)
    }

    func adjustIfNeeded() {
        guard !isAutoScrolling, let currentID else { return }
        if currentID == 0 {
            self.currentID = items.count - 2
        } else if currentID == items.count - 1 {
            self.currentID = 1
        }
    }
}
