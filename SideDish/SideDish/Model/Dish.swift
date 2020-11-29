//
//  Dish.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import Foundation

struct DishResponse: Decodable {
    let statusCode: Int
    let body: [Dish]
}

struct Dish: Hashable, Decodable {
    let detailHash: String
    let image: String
    let deliveryType: [String]
    let title: String
    let description: String
    let originalPrice: String?
    let specialPrice: String
    let badge: [String]?
    
    enum CodingKeys: String, CodingKey {
        case detailHash = "detail_hash"
        case image
        case deliveryType = "delivery_type"
        case title
        case description
        case originalPrice = "n_price"
        case specialPrice = "s_price"
        case badge
    }
}

enum DishCategory {
    case main
    case side
    case soup
}

extension Dish {
    static func MakeDummyDish() -> Dish {
        return Dish(detailHash: "",
                    image: "dummy",
                    deliveryType: ["새벽배송", "전국택배"],
                    title: "[미노리키친] 규동 250g",
                    description: "일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥",
                    originalPrice: "7,000",
                    specialPrice: "6,500원",
                    badge: ["이벤트 특가"])
    }
}
