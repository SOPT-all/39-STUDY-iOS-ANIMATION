//
//  ToastModifier.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 10/22/26.
//

import SwiftUI
import Foundation

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let title: String
    var duration: Double = 1.5

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {   // 위치는 자유롭게: .center, .top 등
                if isPresented {
                    ToastView(title: title)
                        .padding(.bottom, 40)
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                        .task {
                            try? await Task.sleep(for: .seconds(duration))
                            withAnimation(.easeInOut(duration: 0.3)) {
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
