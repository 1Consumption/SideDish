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
        ScrollView {
            LazyVGrid(columns: [.init()], pinnedViews: [.sectionHeaders]) {
                ForEach(sideDish, id: \.self) { category in
                    SectionView(category: category)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct SectionView: View {
    private let category: DishWithTitle
    
    init(category: DishWithTitle) {
        self.category = category
    }
    
    var body: some View {
        Section(header: SideDishHeader(category: category.title, description: category.subTitle)) {
            ForEach(category.dish, id: \.self) { sideDish in
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        SideDishRow(dish: sideDish)
                    })
            }
        }
    }
}

struct SideDishGridView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishGridView(sideDish: [
            DishWithTitle(title: DishCategory.main.title,
                          subTitle: DishCategory.main.subTitle,
                          dish: [Dish.MakeDummyDish()])
        ])
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(category: DishWithTitle(title: DishCategory.main.title,
                                            subTitle: DishCategory.main.subTitle,
                                            dish: [Dish.MakeDummyDish()]))
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
