//
//  SideDishRow.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import SwiftUI

struct SideDishRow: View {
    let dish: Dish
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(dish.image)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 80)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3) {
                Text(dish.title)
                    .font(.caption)
                    .bold()
                Text(dish.description)
                    .font(.caption2)
                    .foregroundColor(.gray)
                HStack {
                    if let originalPrice = dish.originalPirce {
                        Text(originalPrice)
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .strikethrough()
                    }
                    Text(dish.specialPrice)
                        .font(.caption)
                        .foregroundColor(.themeColor)
                        .bold()
                }
                HStack(spacing: 5) {
                    ForEach(dish.deliveryType, id: \.self) { event in
                        EventView(event: event, textColor: .white, backgroundColor: .purple)
                    }
                    ForEach(dish.bagde, id: \.self) { event in
                        EventView(event: event, textColor: .white, backgroundColor: .orange)
                    }
                }
            }
            .lineLimit(1)
            Spacer()
        }
        .padding(.horizontal, 5)
    }
}

struct SideDishRow_Previews: PreviewProvider {
    static var previews: some View {
        SideDishRow(dish: Dish.MakeDummyDish())
            .previewLayout(.fixed(width: 320, height: 100))
    }
}
