//
//  StretchStickyHeaderView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/26/26.
//

import SwiftUI

struct StretchStickyHeaderView: View {
    @State private var viewModel = StretchStickyHeaderViewModel()
    private let headerHeight: CGFloat = 300

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                header

                Section {
                    ForEach(viewModel.currentItems, id: \.self) { item in
                        Text(item)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(.background)
                    }
                } header: {
                    tabBar
                }
            }
        }
    }

    private var header: some View {
        Image(viewModel.headerImageName)
            .resizable()
            .scaledToFill()
            .frame(height: headerHeight)
            .clipped()
            .overlay {
                Color.black
                    .visualEffect { content, proxy in
                        let minY = proxy.frame(in: .scrollView).minY
                        let progress = min(max(-minY / headerHeight, 0), 1)
                        return content.opacity(progress * 0.7)
                    }
            }
            .visualEffect { content, proxy in
                let minY = proxy.frame(in: .scrollView).minY
                return content
                    .scaleEffect(minY > 0 ? 1 + minY / headerHeight : 1, anchor: .bottom)
                    .offset(y: minY < 0 ? -minY / 2 : 0)
            }
    }
    
    private var tabBar: some View {
        HStack(spacing: 0) {
            ForEach(StretchStickyHeaderTab.allCases) { tab in
                let isSelected = viewModel.selectedTab == tab

                Button {
                    viewModel.select(tab)
                } label: {
                    Text(tab.rawValue)
                        .font(.subheadline.weight(isSelected ? .bold : .regular))
                        .foregroundStyle(isSelected ? .black : .gray)
                        .frame(maxWidth: .infinity, minHeight: 44)
                }
            }
        }
        .background(.background)
        .overlay(alignment: .bottom) {
            Divider()
        }
    }
}

#Preview {
    StretchStickyHeaderView()
}
