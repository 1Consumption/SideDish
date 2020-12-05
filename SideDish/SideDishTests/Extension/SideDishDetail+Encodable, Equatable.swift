//
//  SideDishDetail+Encodable, Equatable.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/12/05.
//

@testable import SideDish
import Foundation

extension SideDishDetail: Encodable, Equatable {
    public static func == (lhs: SideDishDetail, rhs: SideDishDetail) -> Bool {
        return lhs.hash == rhs.hash
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(hash, forKey: .hash)
        try container.encode(data, forKey: .data)
    }
    
    enum CodingKeys: String, CodingKey {
        case hash
        case data
    }
}

extension SideDishDetailData: Encodable, Equatable {
    public static func == (lhs: SideDishDetailData, rhs: SideDishDetailData) -> Bool {
        return lhs.topImage == rhs.topImage
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(topImage, forKey: .topImage)
        try container.encode(thumbImages, forKey: .thumbImages)
        try container.encode(productDescription, forKey: .productDescription)
        try container.encode(point, forKey: .point)
        try container.encode(deliveryInfo, forKey: .deliveryInfo)
        try container.encode(deliveryFee, forKey: .deliveryFee)
        try container.encode(prices, forKey: .prices)
        try container.encode(detailSection, forKey: .detailSection)
    }
    
    enum CodingKeys: String, CodingKey {
        case topImage
        case thumbImages
        case productDescription
        case point
        case deliveryInfo
        case deliveryFee
        case prices
        case detailSection
    }
}

