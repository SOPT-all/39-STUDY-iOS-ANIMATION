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
        VStack(spacing: 40) {
            
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
            
            HStack(spacing: 20) {
                Button("외출하기") {
                    toastMessage = "부릉부릉~"
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isShowingToast = true
                    }
                    withAnimation(.easeIn(duration: 1)) {
                        offset = CGSize(width: 600 , height: 0)
                    }
                
                }
                Button("돌아오기"){
                    toastMessage = "저 돌아왔어요"
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isShowingToast = true
                    }
                    offset = CGSize(width: -300, height: 0)
                    withAnimation(.easeIn(duration: 1)) {
                        offset = CGSize(width: 0 , height: 0)
                    }
                    
                }
                Button("칭찬하기") {
                    toastMessage = "오예 빙글빙글"
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isShowingToast = true
                    }
                    withAnimation(.easeInOut(duration: 1)) {
                        angle = .degrees(360)
                    } completion: {
                        withAnimation(.easeInOut(duration: 1)) {
                            angle = .zero
                        }
                    }
                }
                Button("놀래키기") {
                    toastMessage = "아 깜짝이야!!"
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isShowingToast = true
                    }
                    withAnimation(.easeInOut(duration: 0.3)) {
                        scale = 2
                    } completion: {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            scale = 1
                        }
                    }
                }
                
                
            }
            .toast(isPresented: $isShowingToast, title: toastMessage)
            
        }
    }
}

#Preview {
    MorucarView()
}
