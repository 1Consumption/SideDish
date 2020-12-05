//
//  EndPoint.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/29.
//

import Foundation

struct EndPoint {
    init(path: Path) {
        self.path = path
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path.description
        
        return components.url
    }
    
    private let scheme: String = "https"
    private let host: String = "h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com"
    private let path: Path
    
    enum Path {
        case main
        case side
        case soup
        case detail(String)
        
        var description: String {
            switch self {
            case .main:
                return "/develop/baminchan/main"
            case .side:
                return "/develop/baminchan/side"
            case .soup:
                return "/develop/baminchan/soup"
            case .detail(let key):
                return "/develop/baminchan/detail/\(key)"
            }
        }
    }
}
