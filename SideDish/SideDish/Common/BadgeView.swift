//
//  BadgeView.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import SwiftUI

struct BadgeView: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.caption2)
            .foregroundColor(textColor)
            .padding(.horizontal, 4)
            .padding(.vertical, 2)
            .background(backgroundColor)
            .cornerRadius(5)
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(title: Dish.MakeDummyDish().deliveryType[0], textColor: .white, backgroundColor: .purple)
            .previewLayout(.fixed(width: 50, height: 25))
    }
}
