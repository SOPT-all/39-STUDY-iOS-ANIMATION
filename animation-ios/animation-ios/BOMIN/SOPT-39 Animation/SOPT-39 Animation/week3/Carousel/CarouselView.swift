//
//  CarouselView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/26/26.
//

import SwiftUI

struct CarouselView: View {
    @State private var viewModel = InfinityCarouselViewModel()

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(viewModel.items) { item in
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $viewModel.currentID)
        .scrollIndicators(.hidden)
        .onChange(of: viewModel.currentID) {
            viewModel.adjustIfNeeded()
        }
    }
}
