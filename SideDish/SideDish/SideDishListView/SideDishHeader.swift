//
//  SideDishHeader.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/28.
//

import SwiftUI

struct SideDishHeader: View {
    let category: String
    let description: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                BadgeView(title: category, textColor: .gray, backgroundColor: .clear)
                    .border(Color.gray)
                Text(description)
                    .font(.subheadline)
                    .bold()
            }
            .padding(.vertical, 5)
            Spacer()
            
        }
        .background(Color.backgroundColor)
    }
}

struct SideDishHeader_Previews: PreviewProvider {
    static var previews: some View {
        SideDishHeader(category: "밑반찬", description: "언제 먹어도 든든한 밑반찬")
            .previewLayout(.fixed(width: 200, height: 70))
    }
}
