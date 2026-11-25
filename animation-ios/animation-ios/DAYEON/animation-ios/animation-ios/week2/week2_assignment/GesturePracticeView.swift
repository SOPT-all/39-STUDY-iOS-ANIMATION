//
//  GesturePracticeView.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import SwiftUI

struct GesturePracticeView: View {
    @GestureState private var dragAmount: CGSize = .zero

    private let initialOffset = CGSize(width: -75, height: 85)

    var body: some View {
        ZStack {
            Image(.momonga)
                .resizable()
                .frame(width: 168, height: 192)
                .offset(x: 80, y: -80)
            
            Image(.usagi)
                .resizable()
                .frame(width: 300, height: 300)
                .offset(x: -50, y: 10)

            Image(.toast)
                .resizable()
                .frame(width: 80, height: 80)
                .offset(
                    x: initialOffset.width + dragAmount.width,
                    y: initialOffset.height + dragAmount.height
                )
                .gesture(
                    DragGesture()
                        .updating($dragAmount) { value, state, _ in
                            state = value.translation
                        }
                )
                .animation(.spring(), value: dragAmount)
        }
    }
}

#Preview {
    GesturePracticeView()
}
