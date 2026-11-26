//
//  StretchHeaderView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/26/26.
//

import SwiftUI

struct StretchHeaderView: View {
    private let headerHeight: CGFloat = 300

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image("header")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                    .visualEffect { content, proxy in
                        let minY = proxy.frame(in: .scrollView).minY
                        return content.scaleEffect(minY > 0 ? 1 + minY / 300 : 1, anchor: .bottom)
                    }

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
