//
//  ToastModifier.swift
//  animation-ios
//
//  Created by dayeon on 10/19/26.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let title: String
    var duration: Double = 1.5

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if isPresented {
                    ToastView(title: title)
                        .padding(.bottom, 40)
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                        .task {
                            try? await Task.sleep(for: .seconds(duration))
                            withAnimation(.easeInOut(duration: 0.8)) {
                                isPresented = false
                            }
                        }
                }
            }
    }
}

extension View {
    func toast(isPresented: Binding<Bool>, title: String) -> some View {
        modifier(ToastModifier(isPresented: isPresented, title: title))
    }
}
