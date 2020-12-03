//
//  NetworkError.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/29.
//

@testable import SideDish
import Foundation

extension NetworkError: Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.requestError, .requestError):
            return true
        case (.notHTTPResponse, .notHTTPResponse):
            return true
        case (.invalidStatusCode(let firstCode), .invalidStatusCode(let secondCode)):
            return firstCode == secondCode
        case (.unknownError(_), .unknownError(_)):
            return true
        default:
            return false
        }
    }
}
