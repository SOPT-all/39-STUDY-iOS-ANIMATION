//
//  ContentView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 10/21/26.
//

import SwiftUI

struct ContentView: View {
    @State var isShowing = false
    var body: some View {
        if isShowing {
            Text("안녕")
        
                // .transition(.scale)           // 커지면서 나타남
                // .transition(.move(edge: .bottom)) // 아래에서 올라옴
        }

        Button("토글") {
            withAnimation { isShowing.toggle() }  // transition도 withAnimation 안에서 바뀌어야 적용
        }
    }
}

#Preview {
    ContentView()
}
