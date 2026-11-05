//
//  TapPracticeView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/5/26.
//

import SwiftUI

struct TapPracticeView: View {
    // 1. 회전 각도를 상태로 들고 있기
    @State private var angle: Double = 0

    var body: some View {
        Image(.morucar2)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            // 2. 현재 각도만큼 회전시켜서 보여주기
            .rotationEffect(.degrees(angle))
            // 3. 탭되면 각도를 360 더하기 (애니메이션과 함께)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    angle += 180
                }
            }
        
        Image(.morucar)
            .resizable()
            .onTapGesture { print("tap") }
            .frame(width: 50, height: 50)
            .frame(width: 300, height: 300)
        

        // 300x300 영역 전체가 탭됨 (단, 투명 영역은 contentShape 필요)
        Image(.morucar)
            .resizable()
            .frame(width: 50, height: 50)
            .frame(width: 300, height: 300)
            .contentShape(Rectangle())
            .onTapGesture { print("tap") }
    }
}

#Preview {
    TapPracticeView()
}
