//
//  Dish.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import Foundation

struct Dish: Identifiable {
    let id: UUID = UUID()
    let image: String
    let title: String
    let description: String
    let deliveryType: [String]
    let bagde: [String]
    let originalPirce: String?
    let specialPrice: String
}

extension Dish {
    static func MakeDummyDish() -> Dish {
        return Dish(image: "dummy",
                    title: "[미노리키친] 규동 250g",
                    description: "일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥",
                    deliveryType: ["새벽배송", "전국택배"],
                    bagde: ["이벤트 특가"],
                    originalPirce: "7,000",
                    specialPrice: "6,500원")
    }
}
