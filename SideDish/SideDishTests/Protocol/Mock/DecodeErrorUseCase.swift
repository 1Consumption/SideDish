//
//  DecodeErrorUseCase.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/30.
//

@testable import SideDish
import Foundation

struct FailureMockModel: Codable, Equatable {
    let id: Int
}

struct DecodeErrorMockUseCase: RetrievePublisherable {
    typealias T = FailureMockModel
    var dataPublisher: DataPublishable
}
