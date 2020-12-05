//
//  PageView.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/05.
//

import KingfisherSwiftUI
import SwiftUI

struct PageView: View {
    private let imageUrl: [String]
    private let size: CGSize
    
    init(imageUrl: [String], size: CGSize) {
        self.imageUrl = imageUrl
        self.size = size
    }
    
    var body: some View {
        LazyHStack {
            TabView {
                ForEach(imageUrl, id:\.self) {
                    KFImage(URL(string: $0))
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.width, height: size.height * 0.4)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(imageUrl: [
            "http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/2ad963a9f63d371826748c852a0025c3.jpg",
            "http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/f945d8ac1dccc3f931bcaf35de5de582.jpg",
            "http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/bacb0b8186371bfafbd92dbeec718e13.jpg",
            "http://public.codesquad.kr/jk/storeapp/data/detail/H26C7/b96b02e9a956c6d5ad1e10eb14ba81e0.jpg"
        ],
        size: CGSize(width: 300, height: 200))
        .previewLayout(.fixed(width: 300, height: 200))
    }
}
