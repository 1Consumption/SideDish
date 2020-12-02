//
//  DishCategory.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/01.
//

import Foundation

enum DishCategory: CaseIterable {
    case main
    case soup
    case side
    
    var title: String {
        switch self {
        case .main:
            return "메인요리"
        case .soup:
            return "국물요리"
        case .side:
            return "밑반찬"
        }
    }
    
    var subTitle: String {
        switch self {
        case .main:
            return "한그릇 뚝딱 메인요리"
        case .soup:
            return "김이 모락모락 국, 찌개"
        case .side:
            return "언제 먹어도 든든한 밑반찬"
        }
    }
}
