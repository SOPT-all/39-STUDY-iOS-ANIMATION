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
        .aspectRatio(1, contentMode: .fit)
        .onChange(of: viewModel.currentID) {
            viewModel.adjustIfNeeded()
        }
        .overlay(alignment: .bottomTrailing) {
            Text(viewModel.pageText)
                .font(.caption.bold())
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(.black.opacity(0.5), in: Capsule())
                .padding(.bottom, 12)
                .padding(.trailing, 16)
        }
        .task {
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(3))
                guard !Task.isCancelled else { break }
                viewModel.moveToNext()
            }
        }
        
    }
}
