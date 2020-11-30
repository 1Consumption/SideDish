//
//  Dish+Encodable.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/30.
//

@testable import SideDish
import Foundation

extension Dish: Encodable{
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(detailHash, forKey: .detailHash)
        try container.encode(image, forKey: .image)
        try container.encode(deliveryType, forKey: .deliveryType)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(originalPrice, forKey: .originalPrice)
        try container.encode(specialPrice, forKey: .specialPrice)
        try container.encode(badge, forKey: .badge)
    }
}

extension DishResponse: Encodable, Equatable {
    public static func == (lhs: DishResponse, rhs: DishResponse) -> Bool {
        return lhs.body == rhs.body
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(statusCode, forKey: .statusCode)
        try container.encode(body, forKey: .body)
    }
    enum CodingKeys: String, CodingKey {
        case statusCode
        case body
    }
}
