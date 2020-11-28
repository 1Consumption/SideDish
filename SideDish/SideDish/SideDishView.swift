//
//  SideDishView.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import SwiftUI

struct SideDishView: View {
    let main: [Dish] = Dish.MakeDummyMain()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [.init()], pinnedViews: [.sectionHeaders]) {
                ForEach(0..<2) { _ in
                    Section(header: SideDishHeader(category: "밑반찬", description: "언제 먹어도 든든한 밑반찬")) {
                        ForEach(main, id: \.self) { dish in
                            SideDishRow(dish: dish)
                                .id(UUID())
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct SideDishView_Previews: PreviewProvider{
    static var previews: some View {
        SideDishView()
            .considerStatusBar()
    }
}
