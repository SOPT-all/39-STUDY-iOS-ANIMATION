//
//  ToastView.swift
//  animation-ios
//
//  Created by dayeon on 10/19/26.
//

import SwiftUI

struct ToastView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium))
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(.black.opacity(0.8), in: .capsule)
    }
}
