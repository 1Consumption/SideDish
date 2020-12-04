//
//  UseCaseError.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/29.
//

import Foundation

enum UseCaseError: Error {
    case decodeError
    case networkError(NetworkError)
    
    var errorMessage: String {
        switch self {
        case .decodeError:
            return "응답을 복호화 하는 도중 에러가 발생했습니다."
        case .networkError(let networkError):
            return networkError.errorMessage
        }
    }
}
