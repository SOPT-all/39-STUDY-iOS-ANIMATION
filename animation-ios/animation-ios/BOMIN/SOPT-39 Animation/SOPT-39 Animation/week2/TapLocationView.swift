//
//  TabLocationView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/5/26.
//

import SwiftUI

struct TapLocationView: View {
    @State private var tappedPoint: CGPoint? = nil

    var body: some View {
        ZStack {
            Color.white.opacity(0.3)

            if let point = tappedPoint {
                Image(.morucar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
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
