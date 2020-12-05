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
    
    var errorMessage: String {
        switch self {
        case .requestError:
            return "요청을 보내는 중에 에러가 발생했습니다."
        case .notHTTPResponse:
            return "응답에 문제가 있습니다."
        case .invalidStatusCode(let code):
            return "\(code) 상태 코드 에러가 발생했습니다."
        case .unknownError(let error):
            return "알수없는 에러가 발생했습니다. \(error)"
        }
    }
}
