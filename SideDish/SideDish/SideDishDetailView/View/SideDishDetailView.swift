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
                if let images = viewModel.sideDishDetail?.data.thumbImages {
                    PageView(imageUrl: images, size: geometry.size)
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
        SideDishDetailView(key: "", title: "")
    }
}
