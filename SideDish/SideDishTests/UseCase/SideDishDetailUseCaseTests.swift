//
//  SideDishDetailUseCaseTests.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/12/05.
//

@testable import SideDish
import Combine
import XCTest

final class SideDishDetailUseCaseTests: XCTestCase {
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let model: SideDishDetail = SideDishDetail(hash: "Hash",
                                                       data: SideDishDetailData(topImage: "",
                                                                                thumbImages: [],
                                                                                productDescription: "",
                                                                                point: "",
                                                                                deliveryInfo: "",
                                                                                deliveryFee: "",
                                                                                prices: [],
                                                                                detailSection: []))
    
    func testRetrieveSideDishDetailPublihser() {
        let expectation = XCTestExpectation(description: "testRetrieveSideDishDetailPublihser")
        defer { wait(for: [expectation], timeout: 5) }
        
        SideDishDetailUseCase(dataPublisher: MockNetworkSuccessManager(model: model))
            .retrieveSideDishDetailPublihser(with: "")
            .sink { state in
                if state == .finished {
                    expectation.fulfill()
                }
            } receiveValue: { [weak self] received in
                XCTAssertEqual(self?.model, received)
            }
            .store(in: &bag)
    }
}
