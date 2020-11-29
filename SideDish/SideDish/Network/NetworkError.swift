//
//  NetworkError.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/29.
//

import Foundation

enum NetworkError: Error {
    case requestError
    case notHTTPResponse
    case invalidStatusCode(Int)
    case unknownError(String)
}
