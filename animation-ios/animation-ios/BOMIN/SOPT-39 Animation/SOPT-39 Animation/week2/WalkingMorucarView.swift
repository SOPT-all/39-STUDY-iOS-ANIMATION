//
//  WalkingMorucarView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/5/26.
//

import SwiftUI

struct WalkingMorucarView: View {
    @State private var angle: Double = 0
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    
    var body: some View {
        VStack{
            Text("모루카를 탈출시켜줘~")
                .font(.system(size: 20, weight: .bold))
            
            Image(.grassmaze)
                .resizable()
            
            HStack{
                Image(.morucarRemove)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .rotationEffect(.degrees(angle))
                    .offset(offset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                offset = CGSize(
                                    width: lastOffset.width + value.translation.width,
                                    height: lastOffset.height + value.translation.height
                                )
                            }
                            .onEnded { _ in
                                lastOffset = offset
                            }
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            angle += 360
                        }
                    }
                
                VStack{
                    Text("시작점으로 모루카를 옮겨 시작해보세요")
                    Text("터치하면 회전도 합니다")
                }
            }
        }
    }
}

#Preview {
    WalkingMorucarView()
}
