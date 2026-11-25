//
//  StretchHeaderView.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import SwiftUI

struct StretchHeaderView: View {
    private let headerHeight: CGFloat = 300

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .scrollView).minY
                    let stretch = max(minY, 0)
                    Image("header")
                        .resizable()
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: headerHeight + stretch)
                        .clipped()
                        .offset(y: -stretch)
                }
                .frame(height: headerHeight)

                LazyVStack {
                    ForEach(0..<30, id: \.self) { index in
                        Text("Row \(index)")
                            .frame(maxWidth: .infinity, minHeight: 44)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    StretchHeaderView()
}
