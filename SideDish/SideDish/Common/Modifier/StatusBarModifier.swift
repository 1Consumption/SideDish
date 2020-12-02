//
//  StatusBarModifier.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import SwiftUI

struct StatusBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            Rectangle()
                .frame(height: 0)
                .ignoresSafeArea(.all, edges: .top)
                .foregroundColor(.clear)
            content
        }
    }
}
