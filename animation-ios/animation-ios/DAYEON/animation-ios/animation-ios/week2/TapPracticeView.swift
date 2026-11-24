//
//  TapPracticeView.swift
//  animation-ios
//
//  Created by dayeon on 11/24/26.
//


import SwiftUI

struct TapPracticeView: View {
    @State private var angle: Double = 0

    var body: some View {
        Image(.ganadi)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .rotationEffect(.degrees(angle))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    angle += 360
                }
            }
    }
}

#Preview {
    TapPracticeView()
}
