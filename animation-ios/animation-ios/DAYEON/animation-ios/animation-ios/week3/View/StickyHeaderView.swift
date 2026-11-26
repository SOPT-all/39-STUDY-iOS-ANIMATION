//
//  StickyHeaderView.swift
//  animation-ios
//
//  Created by dayeon on 11/25/26.
//

import SwiftUI

struct StickyHeaderView: View {
    @State private var viewModel = StickyHeaderViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                Text("스티키헤더야")
                    .frame(maxWidth: .infinity, minHeight: 400)

                Section {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item)
                            .frame(maxWidth: .infinity, minHeight: 44)
                    }
                } header: {
                    Text(viewModel.headerTitle)
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(.red)
                }
            }
        }
    }
}

#Preview {
    StickyHeaderView()
}
