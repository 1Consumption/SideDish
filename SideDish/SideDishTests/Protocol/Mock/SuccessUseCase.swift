//
//  SuccessUseCase.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/30.
//

@testable import SideDish
import Foundation

struct MockModel: Codable, Equatable {
    let name: String
}

struct MockUseCase: RetrievePublisherable {
    typealias T = MockModel
    var dataPublisher: DataPublishable
}
