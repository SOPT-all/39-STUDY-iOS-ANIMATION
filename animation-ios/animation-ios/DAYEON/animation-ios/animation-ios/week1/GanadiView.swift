//
//  GanadiView.swift
//  animation-ios
//
//  Created by dayeon on 10/19/26.
//

import SwiftUI

struct GanadiView: View {
    @State private var offset: CGSize = .zero
    @State private var angle: Angle = .zero
    @State private var scale: CGFloat = 1

    var body: some View {
        VStack(spacing: 40) {
            Image(.ganadi)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .rotationEffect(angle)
                .scaleEffect(scale)
                .offset(offset)

            HStack(spacing: 16) {
                Button("이동") {
                    withAnimation(.easeInOut(duration: 1)) {
                        offset = CGSize(width: 100, height: 100)
                    }
                }

                Button("회전") {
                    withAnimation(.easeInOut(duration: 1)) {
                        angle = .radians(.pi)
                    }
                }

                Button("크기") {
                    withAnimation(.easeInOut(duration: 1)) {
                        scale = 5
                    }
                }
            }
        }
    }
}

#Preview {
    GanadiView()
}
