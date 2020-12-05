//
//  SideDishDetailViewModelTests.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/12/05.
//

@testable import SideDish
import Combine
import XCTest

class SideDishDetailViewModelTests: XCTestCase {
    private var viewModel: SideDishDetailViewModel!
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
    
    func testViewModelRetrieveDataSuccess() {
        let expecation = XCTestExpectation(description: "testViewModelRetrieveDataSuccess")
        defer { wait(for: [expecation], timeout: 5) }
        viewModel = SideDishDetailViewModel(dataPublisher: MockNetworkSuccessManager(model: model))
        viewModel.retrieveSideDishDetail(with: "")
        viewModel.$sideDishDetail
            .sink { [weak self] result in
                if let result = result {
                    expecation.fulfill()
                    XCTAssertEqual(self?.model, result)
                }
            }
            .store(in: &bag)
    }
    
    func testViewModelRetrieveDataFailure() {
        let expecation = XCTestExpectation(description: "testViewModelRetrieveDataFailure")
        defer { wait(for: [expecation], timeout: 5) }
        viewModel = SideDishDetailViewModel(dataPublisher: MockNetworkFailureManager(error: .requestError))
        viewModel.retrieveSideDishDetail(with: "")
        viewModel.$isErrorOccured
            .sink { isErrorOccured in
                if isErrorOccured {
                    expecation.fulfill()
                }
            }
            .store(in: &bag)
    }
}
