//
//  DishUseCaseTests.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/30.
//

@testable import SideDish
import Combine
import XCTest

class DishUseCaseTests: XCTestCase {
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let model: DishResponse = DishResponse(statusCode: 200,
                                                   body: [
                                                    Dish(detailHash: "test",
                                                         image: "test",
                                                         deliveryType: [],
                                                         title: "test",
                                                         description: "test",
                                                         originalPrice: nil,
                                                         specialPrice: "test",
                                                         badge: nil)
                                                   ])
    
    func testRetrieveDishPublisher() {
        let expectation = XCTestExpectation(description: "testRetrieveDishPublisher")
        defer { wait(for: [expectation], timeout: 5) }
        
        DishUseCase(dataPublisher: MockNetworkSuccessManager(model: model))
            .retrieveDishPublisher(with: .main)
            .sink { result in
                switch result {
                case .failure(_):
                    XCTFail()
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { response in
                XCTAssertEqual(self.model, response)
            }
            .store(in: &bag)
    }
}
