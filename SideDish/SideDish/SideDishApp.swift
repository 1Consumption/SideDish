//
//  SideDishApp.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import SwiftUI

@main
struct SideDishApp: App {
    var body: some Scene {
        WindowGroup {
            SideDishView()
                .considerStatusBar()
        }
    }
}
