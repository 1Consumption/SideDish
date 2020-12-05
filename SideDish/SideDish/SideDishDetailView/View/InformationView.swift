//
//  InformationView.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/06.
//

import SwiftUI

struct InformationView: View {
    private let title: String
    private let info: String
    
    init(title: String, info: String) {
        self.title = title
        self.info = info
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.caption)
                .frame(width: 50, alignment: .leading)
            Text(info)
                .font(.caption2)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}
struct SideDishDetailInfo_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(title: "적립금", info: "52원")
    }
}
