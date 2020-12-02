//
//  SideDishRow.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import KingfisherSwiftUI
import SwiftUI

struct SideDishRow: View {
    let dish: Dish
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            KFImage(URL(string: dish.image))
                .cancelOnDisappear(true)
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
                    if let originalPrice = dish.originalPrice {
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
                        BadgeView(title: event, textColor: .white, backgroundColor: .purple)
                    }
                    if let badges = dish.badge {
                        ForEach(badges, id: \.self) { event in
                            BadgeView(title: event, textColor: .white, backgroundColor: .orange)
                        }
                    }
                }
            }
            .lineLimit(1)
            Spacer()
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 5)
    }
}

struct SideDishRow_Previews: PreviewProvider {
    static var previews: some View {
        SideDishRow(dish: Dish.MakeDummyDish())
            .previewLayout(.fixed(width: 320, height: 100))
    }
}
