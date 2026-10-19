//
//  ToastPracticeView.swift
//  animation-ios
//
//  Created by dayeon on 10/19/26.
//

import SwiftUI

struct ToastPracticeView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: .regular))
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.blue)
    }
}

struct ToastPracticeModifier: ViewModifier {
    @Binding var isPresented: Bool
    let title: String
    var duration: Double = 1.5
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if isPresented {
                    ToastPracticeView(title: title)
                        .fixedSize()
                        .padding(.bottom, 30)
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                        .task {
                            try? await Task.sleep(for: .seconds(duration))
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isPresented = false
                            }
                        }
                }
            }
    }
}

extension View {
    func toastPractice(isPresented: Binding<Bool>, title: String) -> some View {
        modifier(ToastPracticeModifier(isPresented: isPresented, title: title))
    }
}
