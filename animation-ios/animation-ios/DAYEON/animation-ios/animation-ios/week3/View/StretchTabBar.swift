//
//  StretchTabBar.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import SwiftUI

struct StretchTabBar: View {
    @Binding var selectedTab: ProfileTab
    let topInset: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            Color(.systemBackground)
                .frame(height: topInset)
                .visualEffect { content, proxy in
                    let minY = proxy.frame(in: .scrollView).minY
                    return content.opacity(minY <= 0 ? 1 : 0)
                }

            HStack(spacing: 0) {
                ForEach(ProfileTab.allCases) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedTab = tab
                        }
                    } label: {
                        VStack(spacing: 10) {
                            Text(tab.rawValue)
                                .font(.subheadline)
                                .fontWeight(selectedTab == tab ? .bold : .regular)
                                .foregroundStyle(selectedTab == tab ? .primary : .secondary)
                            Rectangle()
                                .fill(selectedTab == tab ? Color.primary : Color.clear)
                                .frame(height: 2)
                        }
                        .padding(.top, 12)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
            }
            .background(Color(.systemBackground))

            Divider()
        }
    }
}
