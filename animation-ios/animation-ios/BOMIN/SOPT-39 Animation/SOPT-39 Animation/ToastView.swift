//
//  ToastView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 10/22/26.
//

import SwiftUI


struct ToastView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium))
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
            .frame(height: 40)
            .background(.black.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
    
    struct ToastTestView: View {
        @State private var isShowingToast = false
        
        var body: some View {
            ZStack {
                Button("토스트 띄우기") {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isShowingToast = true
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toast(isPresented: $isShowingToast, title: "감사합니다")
        }
    }
    
   


#Preview {
    ToastTestView()
}
