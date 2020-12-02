//
//  SideDishGridView.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/02.
//

import SwiftUI

struct SideDishGridView: View {
    private let sideDish: [DishWithTitle]
    
    init(sideDish: [DishWithTitle]) {
        self.sideDish = sideDish
    }
    
    var body: some View {
        LazyVGrid(columns: [.init()], pinnedViews: [.sectionHeaders]) {
            ForEach(sideDish, id: \.self) { category in
                Section(header: SideDishHeader(category: category.title, description: category.subTitle)) {
                    ForEach(category.dish, id: \.self) {
                        SideDishRow(dish: $0)
                    }
                }
            }
        }
    }
}
