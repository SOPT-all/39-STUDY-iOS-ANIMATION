//
//  MorucarView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 10/21/26.
//


import SwiftUI

struct MorucarView: View {
    @State private var offset: CGSize = .zero
    @State private var angle: Angle = .zero
    @State private var scale: CGFloat = 1
    
    @State private var isShowingToast = false
    @State private var toastMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("모루카 키우기")
                .font(.system(size: 30, weight: .bold))
                .padding(10)
    
            Image(.morucar)
                .resizable()
                .scaledToFit()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .scaleEffect(scale)
                .rotationEffect(angle)
                .offset(offset)
        
            Color.clear
                .frame(height: 60)
                .toast(isPresented: $isShowingToast, title: toastMessage)
            
            HStack(spacing: 20) {
                Button("외출하기") {
                    showToast(message: "부릉부릉~")
                    withAnimation(.easeIn(duration: 1)) {
                        offset = CGSize(width: 600 , height: 0)
                    } completion: {
                        offset = CGSize(width: -300, height: 0)  // 화면 밖에서 대기
                    }
                }
                
                Button("돌아오기") {
                    showToast(message: "저 돌아왔어요")
                    withAnimation(.easeOut(duration: 1)) {
                        offset = .zero
                    }
                }
                
                Button("칭찬하기") {
                    showToast(message: "오예 신난다")
                    withAnimation(.easeInOut(duration: 1)) {
                        angle = .degrees(360)
                    } completion: {
                        withAnimation(.easeInOut(duration: 1)) {
                            angle = .zero
                        }
                    }
                }
                Button("놀래키기") {
                    showToast(message: "아깜짝이야")
                    withAnimation(.easeInOut(duration: 0.3)) {
                        scale = 2
                    } completion: {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            scale = 1
                        }
                    }
                }
            }
        }
    }
    
    private func showToast(message: String) {
        toastMessage = message
        withAnimation(.easeInOut(duration: 0.3)) {
            isShowingToast = true
        }
    }
}

#Preview {
    MorucarView()
}
