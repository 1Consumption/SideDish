//
//  View.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import SwiftUI

extension View {
    func considerStatusBar() -> some View {
        return modifier(StatusBarModifier())
    }
}
