//
//  SnapBackView.swift
//  animation-ios
//
//  Created by dayeon on 11/24/26.
//
import SwiftUI

struct SnapBackView: View {
    @GestureState private var dragAmount: CGSize = .zero

    var body: some View {
        Image(.ganadi)
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .updating($dragAmount) { value, state, _ in
                        state = value.translation
                    }
            )
            .animation(.spring(), value: dragAmount)
    }
}

#Preview {
    SnapBackView()
}
