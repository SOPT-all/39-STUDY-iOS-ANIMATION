//
//  KeyFramePracitceView.swift
//  animation-ios
//
//  Created by dayeon on 10/19/26.
//

import SwiftUI

struct CharacterValues {
    var offset: CGSize = .zero
    var angle: Angle = .zero
    var scale: CGFloat = 1
}

struct KeyFramePracitceView: View {
    @State private var isShowingToast = false
    @State private var isRunning = false
    @State private var ggobukOffset = CGSize(width: 105, height: -45)
    @State private var esanghaeOffset = CGSize(width: -100, height: 65)
    
    var body: some View {
        ZStack (alignment: .center) {
            Image(.background)
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
            
            VStack (alignment: .leading, spacing: 8) {
                Button ("► 가라!") {
                    withAnimation(.easeInOut(duration: 1)) {
                        ggobukOffset = .zero
                        esanghaeOffset = .zero
                    } completion: {
                        isRunning = true
                    }
                }
                
                Button ("► 돌아와!") {
                    isRunning = false
                    withAnimation(.easeInOut(duration: 1)) {
                        ggobukOffset = CGSize(width: 105, height: -45)
                        esanghaeOffset = CGSize(width: -100, height: 65)
                    }
                }
            }
            .font(.galmuri9)
            .foregroundStyle(.black)
            .underline()
            .offset(x: -140, y: 150)
            
            Image(.ggobuk)
                .resizable()
                .frame(width: 100, height: 88)
                .keyframeAnimator(initialValue: CharacterValues(), repeating: isRunning) { [isRunning] content, value in
                    content
                        .scaleEffect(isRunning ? value.scale : CGFloat(1))
                        .rotationEffect(isRunning ? value.angle : Angle.zero)
                        .offset(isRunning ? value.offset : CGSize.zero)
                } keyframes: { _ in
                    KeyframeTrack(\.offset) {
                        LinearKeyframe(CGSize(width: -100, height: -80), duration: 1)
                        LinearKeyframe(CGSize(width: 100, height: 70), duration: 1)
                        LinearKeyframe(CGSize(width: -100, height: -80), duration: 1)
                        LinearKeyframe(CGSize(width: 100, height: 70), duration: 1)
                        LinearKeyframe(CGSize(width: 0, height: 0), duration: 1)
                    }
                    
                    KeyframeTrack(\.angle) {
                        LinearKeyframe(.degrees(1800), duration: 5)
                    }
                    
                    KeyframeTrack(\.scale) {
                        SpringKeyframe(1, duration: 1)
                        SpringKeyframe(2, duration: 1)
                        SpringKeyframe(1, duration: 1)
                        SpringKeyframe(2, duration: 1)
                        SpringKeyframe(1, duration: 1)
                    }
                }
                .offset(ggobukOffset)
            
            Image(.esanghae)
                .resizable()
                .frame(width: 100, height: 68)
                .keyframeAnimator(initialValue: CharacterValues(), repeating: isRunning) { [isRunning] content, value in
                    content
                        .scaleEffect(isRunning ? value.scale : CGFloat(1))
                        .rotationEffect(isRunning ? value.angle : Angle.zero)
                        .offset(isRunning ? value.offset : CGSize.zero)
                } keyframes: { _ in
                    KeyframeTrack(\.offset) {
                        LinearKeyframe(CGSize(width: -100, height: -80), duration: 1)
                        LinearKeyframe(CGSize(width: 100, height: 70), duration: 1)
                        LinearKeyframe(CGSize(width: -100, height: -80), duration: 1)
                        LinearKeyframe(CGSize(width: 100, height: 70), duration: 1)
                        LinearKeyframe(CGSize(width: 0, height: 0), duration: 1)
                      }
                    
                    KeyframeTrack(\.angle) {
                        LinearKeyframe(.degrees(1800), duration: 5)
                    }
                    
                    KeyframeTrack(\.scale) {
                        SpringKeyframe(1, duration: 1)
                        SpringKeyframe(2, duration: 1)
                        SpringKeyframe(1, duration: 1)
                        SpringKeyframe(2, duration: 1)
                        SpringKeyframe(1, duration: 1)
                    }
                }
                .offset(esanghaeOffset)
            
            Button("승자는?") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isShowingToast = true
                }
            }
            .font(.galmuri9)
            .foregroundStyle(.gray)
            .underline()
            .toastPractice(isPresented: $isShowingToast, title: "꼬부기 승!")
            .offset(x: 135, y: 170)
        }
    }
}

#Preview {
    KeyFramePracitceView()
}
