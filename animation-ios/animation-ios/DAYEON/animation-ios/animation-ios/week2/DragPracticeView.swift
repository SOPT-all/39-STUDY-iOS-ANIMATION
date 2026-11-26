//
//  DragPracticeView.swift
//  animation-ios
//
//  Created by dayeon on 11/24/26.
//

import SwiftUI

struct DragPracticeView: View {
    @State private var position: CGSize = .zero
    @GestureState private var dragAmount: CGSize = .zero

    var body: some View {
        Image(.ganadi)
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .offset(CGSize(
                width: position.width + dragAmount.width,
                height: position.height + dragAmount.height
            ))
            .gesture(
                DragGesture()
                    .updating($dragAmount) { value, state, _ in
                        state = value.translation
                    }
                    .onEnded { value in
                        position.width += value.translation.width
                        position.height += value.translation.height
                    }
            )
    }
}

#Preview {
    DragPracticeView()
}
