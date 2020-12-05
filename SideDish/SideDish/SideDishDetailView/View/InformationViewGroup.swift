//
//  InformationViewGroup.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/06.
//

import SwiftUI

struct InformationViewGroup: View {
    private let title: String
    private let productDescription: String
    private let prices: [String]
    private let point: String
    private let deliveryFee: String
    private let deliveryInfo: String
    
    init(title: String, productDescription: String, prices: [String], point: String, deliveryFee: String, deliveryInfo: String) {
        self.title = title
        self.productDescription = productDescription
        self.prices = prices
        self.point = point
        self.deliveryFee = deliveryFee
        self.deliveryInfo = deliveryInfo
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 5) {
                VStack (alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.body)
                        .bold()
                    Text(productDescription)
                        .font(.caption)
                }
                Divider()
                    .padding(.horizontal, -10)
                VStack (alignment: .leading, spacing: 7) {
                    HStack {
                        Text("가격")
                            .font(.caption)
                            .frame(width: 50, alignment: .leading)
                        Spacer()
                        Text(prices[0])
                            .font(.caption2)
                            .foregroundColor(.gray)
                        if prices.count == 2 {
                            Text(prices[1])
                                .font(.caption)
                                .bold()
                                .foregroundColor(.themeColor)
                        }
                    }
                    InformationView(title: "적립금", info: point)
                    InformationView(title: "배송비", info: deliveryFee)
                    InformationView(title: "배송정보", info: deliveryInfo)
                }
            }
        }
        .lineLimit(1)
    }
}

struct SideDishDetailInfoViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        InformationViewGroup(title: "[미노리키친] 규동 250g",
                             productDescription: "일본인의 소울프드! 한국인도 좋아하는 소고기덮밥",
                             prices: ["6,500원", "5,200원"],
                             point: "52원",
                             deliveryFee: "2,500원 (40,000원 이상 구매 시 무료)",
                             deliveryInfo: "서울 경기 새벽배송 / 전국택배 (제주 및 도서산간 불가) [월 · 화 · 수 · 목 · 금 · 토] 수령 가능한 상품입니다.")
            .previewLayout(.fixed(width: 300, height: 150))
    }
}
