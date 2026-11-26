//
//  StretchHeaderView.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import SwiftUI

struct StretchHeaderView: View {
    @State private var viewModel = StretchHeaderViewModel()
    private let headerHeight: CGFloat = 300

    var body: some View {
        GeometryReader { geo in
            let topInset = geo.safeAreaInsets.top

            ScrollView {
                LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                    header
                        .padding(.bottom, -topInset)

                    Section {
                        ForEach(viewModel.currentItems, id: \.self) { item in
                            Text(item)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(Color(.systemBackground))
                        }
                    } header: {
                        StretchTabBar(selectedTab: $viewModel.selectedTab, topInset: topInset)
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }

    private var header: some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .scrollView).minY
            let stretch = max(minY, 0)
            let parallax = minY < 0 ? -minY / 2 : 0
            let progress = min(max(-minY / headerHeight, 0), 1)

            Image(viewModel.headerImageName)
                .resizable()
                .scaledToFill()
                .frame(width: proxy.size.width, height: headerHeight + stretch)
                .clipped()
                .overlay(Color.black.opacity(progress * 0.7))
                .offset(y: -stretch + parallax)
        }
        .frame(height: headerHeight)
    }
}

#Preview {
    StretchHeaderView()
}
