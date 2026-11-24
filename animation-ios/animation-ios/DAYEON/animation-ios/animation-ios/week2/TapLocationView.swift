//
//  TapLocationView.swift
//  animation-ios
//
//  Created by dayeon on 11/24/26.
//

import SwiftUI

struct TapLocationView: View {
    @State private var tappedPoint: CGPoint? = nil

    var body: some View {
        ZStack {
            Color.yellow.opacity(0.3)

            if let point = tappedPoint {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .position(point)
            }
        }
        .onTapGesture { location in
            tappedPoint = location
        }
    }
}

#Preview {
    TapLocationView()
}
