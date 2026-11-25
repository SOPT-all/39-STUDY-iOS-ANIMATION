//
//  StretchHeaderVisualEffectView.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import SwiftUI

struct StretchHeaderVisualEffectView: View {
    private let headerHeight: CGFloat = 300

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image("header")
                    .resizable()
                    .scaledToFill()
                    .frame(height: headerHeight)
                    .clipped()
                    .visualEffect { [headerHeight] content, proxy in
                        let minY = proxy.frame(in: .scrollView).minY
                        let scale = minY > 0 ? 1 + minY / headerHeight : 1
                        return content.scaleEffect(scale, anchor: .bottom)
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
    StretchHeaderVisualEffectView()
}
