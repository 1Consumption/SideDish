//
//  SideDishDetailView.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/05.
//

import Combine
import KingfisherSwiftUI
import SwiftUI

struct SideDishDetailView: View {
    @ObservedObject var viewModel: SideDishDetailViewModel = SideDishDetailViewModel(dataPublisher: NetworkManager())
    private let key: String
    private let title: String
    
    init(key: String, title: String) {
        self.key = key
        self.title = title
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                if let detail = viewModel.sideDishDetail?.data {
                    VStack {
                        PageView(imageUrl: detail.thumbImages)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                        InformationViewGroup(title: title,
                                             productDescription: detail.productDescription,
                                             prices: detail.prices,
                                             point: detail.point,
                                             deliveryFee: detail.deliveryFee,
                                             deliveryInfo: detail.deliveryInfo)
                            .padding(20)
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.retrieveSideDishDetail(with: key)
        }
    }
}

struct SideDishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SideDishDetailView(key: "HBDEF", title: "[미노리키친] 규동 250g")
    }
}
