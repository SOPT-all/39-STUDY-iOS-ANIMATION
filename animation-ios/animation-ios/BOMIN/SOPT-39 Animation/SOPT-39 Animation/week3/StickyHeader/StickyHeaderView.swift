//
//  StickyHeaderView.swift
//  SOPT-39 Animation
//
//  Created by 김보민 on 11/26/26.
//

import SwiftUI

struct StickyHeaderView: View {
    @State private var viewModel = StickyHeaderViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                Text("스티키헤더입니돠~~~~~")
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
