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
            Color.yellow.opacity(0.3)

            if let point = tappedPoint {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .position(point)   // 탭한 위치에 하트 표시
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
