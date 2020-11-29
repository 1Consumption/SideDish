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
}
