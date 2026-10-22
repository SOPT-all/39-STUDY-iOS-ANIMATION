//
//  CircleView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 10/21/26.
//

import SwiftUI

struct CircleView: View {
    @State private var isBig = false

    var body: some View {
        VStack(spacing: 20){
            Text("명시적")
            Circle()
                .frame(width: isBig ? 200 : 100, height: isBig ? 200 : 100)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isBig.toggle() // 이것만 있으면 바로 커짐
                    } completion: {
                        print("커졋어요")
                    }
                }
            Text("암시적")
            Circle()
                .frame(width: isBig ? 200 : 100, height: isBig ? 200 : 100)
                .animation(.easeInOut(duration: 0.5), value: isBig)
                .onTapGesture {
                    isBig.toggle()   // withAnimation 없이도 애니메이션
                }
        }
    }
}

#Preview {
    CircleView()
}
