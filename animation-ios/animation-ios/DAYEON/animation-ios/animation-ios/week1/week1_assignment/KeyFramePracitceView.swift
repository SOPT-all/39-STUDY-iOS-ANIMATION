//
//  KeyFramePracitceView.swift
//  animation-ios
//
//  Created by dayeon on 10/19/26.
//

import SwiftUI

struct KeyFramePracitceView: View {
    @State private var isShowingToast = false
    @State private var isRunning = false
    @State private var ggobukOffset = CGSize(width: 105, height: -45)
    @State private var esanghaeOffset = CGSize(width: -100, height: 65)
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
            
            VStack (alignment: .leading, spacing: 8) {
                Button("► 가라!") {
                    withAnimation(.easeInOut(duration: 1)) {
                        ggobukOffset = .zero
                        esanghaeOffset = .zero
                    } completion: {
                        guard ggobukOffset == .zero else { return }
                        isRunning = true
                    }
                }
                
                Button("► 돌아와!") {
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
            
            KeyFrameCharacter(
                image: .ggobuk,
                size: CGSize(width: 100, height: 88),
                isRunning: isRunning
            )
            .offset(ggobukOffset)
            
            KeyFrameCharacter(
                image: .esanghae,
                size: CGSize(width: 100, height: 68),
                isRunning: isRunning
            )
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
