//
//  InfinityCarouselView.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import SwiftUI

struct InfinityCarouselView: View {
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
        .overlay(alignment: .bottom) {
            Text(viewModel.pageText)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(.black.opacity(0.5), in: Capsule())
                .padding(.bottom, 12)
        }
        .onChange(of: viewModel.currentID) {
            viewModel.adjustIfNeeded()
        }
        .task {
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(3))
                guard !Task.isCancelled else { break }

                viewModel.isAutoScrolling = true
                withAnimation(.easeInOut(duration: 0.5), completionCriteria: .logicallyComplete) {
                    viewModel.moveToNext()
                } completion: {
                    viewModel.isAutoScrolling = false
                    viewModel.adjustIfNeeded()
                }
            }
        }
    }
}

#Preview {
    InfinityCarouselView()
}
