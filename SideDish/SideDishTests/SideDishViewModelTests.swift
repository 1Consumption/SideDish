//
//  SideDishViewModelTests.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/12/01.
//

@testable import SideDish
import Combine
import SwiftUI
import XCTest

class SideDishViewModelTests: XCTestCase {
    private var viewModel: SideDishViewModel!
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let model1: DishResponse = DishResponse(statusCode: 200, body: [Dish(detailHash: "A", image: "", deliveryType: [], title: "", description: "", originalPrice: "", specialPrice: "", badge: [])])
    private let model2: DishResponse = DishResponse(statusCode: 200, body: [Dish(detailHash: "B", image: "", deliveryType: [], title: "", description: "", originalPrice: "", specialPrice: "", badge: [])])
    private let model3: DishResponse = DishResponse(statusCode: 200, body: [Dish(detailHash: "C", image: "", deliveryType: [], title: "", description: "", originalPrice: "", specialPrice: "", badge: [])])
    
    func testViewModelRetrieveDataSynchronously() {
        let expecation = XCTestExpectation(description: "testViewModelRetrieveDataSynchronously")
        viewModel = SideDishViewModel(dataPublisher: MockDishDataPublisher(model1: model1, model2: model2, model3: model3))
        viewModel.$sideDish
            .sink { result in
                if result.count == 3 {
                    expecation.fulfill()
                }
            }
            .store(in: &bag)
        wait(for: [expecation], timeout: 5)
        XCTAssertEqual(viewModel.sideDish[0].dish, model1.body)
        XCTAssertEqual(viewModel.sideDish[1].dish, model2.body)
        XCTAssertEqual(viewModel.sideDish[2].dish, model3.body)
    }
    
    func testViewModelRetrieveDataFailure() {
        let expecation = XCTestExpectation(description: "testViewModelRetrieveDataFailure")
        viewModel = SideDishViewModel(dataPublisher: MockDishDataPublisher(model1: MockModel(name: "decodeFailure"), model2: MockModel(name: "decodeFailure"), model3: MockModel(name: "decodeFailure")))
        viewModel.retrieveDish()
        viewModel.$isErrorOccured
            .sink { isErrorOccured in
                if isErrorOccured {
                    expecation.fulfill()
                }
            }
            .store(in: &bag)
        wait(for: [expecation], timeout: 5)
    }
}

extension DishWithTitle: Encodable{
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(subTitle, forKey: .subTitle)
        try container.encode(dish, forKey: .dish)
    }
    
    enum CodingKeys: String, CodingKey{
        case title
        case subTitle
        case dish
    }
}
