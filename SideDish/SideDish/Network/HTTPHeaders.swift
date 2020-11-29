//
//  HTTPHeaders.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/29.
//

import Foundation

struct HTTPHeaders {
    private(set) var list: [String: String] = [String: String]()
    
    mutating func setValue(value: String, field: String) {
        guard list[field] != nil else {
            list.updateValue(value, forKey: field)
            return
        }
        
        list[field] = value
    }
}
