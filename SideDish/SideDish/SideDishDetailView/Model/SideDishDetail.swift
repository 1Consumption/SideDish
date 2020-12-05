//
//  SideDishDetail.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/05.
//

import Foundation

struct SideDishDetail: Decodable {
    let hash: String
    let data: SideDishDetailData
}

struct SideDishDetailData: Decodable {
    let topImage: String
    let thumbImages: [String]
    let productDescription: String
    let point: String
    let deliveryInfo: String
    let deliveryFee: String
    let prices: [String]
    let detailSection: [String]
}
