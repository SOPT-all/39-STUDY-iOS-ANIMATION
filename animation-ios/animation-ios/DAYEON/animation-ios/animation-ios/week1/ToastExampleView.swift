//
//  ToastExampleView.swift
//  animation-ios
//
//  Created by dayeon on 10/19/26.
//

import SwiftUI

struct ToastExampleView: View {
    @State private var isShowingToast = false

    var body: some View {
        Button("토스트 띄우기") {
            withAnimation(.easeInOut(duration: 0.5)) {
                isShowingToast = true
            }
        }
        .toast(isPresented: $isShowingToast, title: "토스트")
    }
}

#Preview {
    ToastExampleView()
}
