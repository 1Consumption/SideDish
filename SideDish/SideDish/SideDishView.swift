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
            LazyVGrid(columns: [.init()]) {
                ForEach(0..<2) { _ in
                    Section {
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
    }
}
