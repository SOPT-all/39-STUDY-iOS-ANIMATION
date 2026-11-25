//
//  StretchHeaderVisualEffectView.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import SwiftUI

struct StretchHeaderVisualEffectView: View {
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
        Color.clear
            .frame(height: headerHeight)
            .overlay {
                Image(viewModel.headerImageName)
                    .resizable()
                    .scaledToFill()
            }
            .clipped()
            .overlay {
                Color.black
                    .visualEffect { [headerHeight] content, proxy in
                        let minY = proxy.frame(in: .scrollView).minY
                        let progress = min(max(-minY / headerHeight, 0), 1)
                        return content.opacity(progress * 0.7)
                    }
            }
            .visualEffect { [headerHeight] content, proxy in
                let minY = proxy.frame(in: .scrollView).minY
                return content
                    .scaleEffect(minY > 0 ? 1 + minY / headerHeight : 1, anchor: .bottom)
                    .offset(y: minY < 0 ? -minY / 2 : 0)
            }
    }
}

#Preview {
    StretchHeaderVisualEffectView()
}
