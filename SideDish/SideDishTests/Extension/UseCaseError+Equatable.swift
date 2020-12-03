//
//  UseCaseError+Equatable.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/30.
//

@testable import SideDish
import Foundation

extension UseCaseError: Equatable {
    public static func == (lhs: UseCaseError, rhs: UseCaseError) -> Bool {
        switch (lhs, rhs) {
        case (.decodeError, .decodeError), (.networkError(_), .networkError(_)):
            return true
        default:
            return false
        }
    }
}
