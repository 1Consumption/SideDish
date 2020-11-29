//
//  RetrievePublisherableTests.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/30.
//

@testable import SideDish
import Combine
import XCTest

class RetrievePublisherableTests: XCTestCase {
    private let mockModel: MockModel = MockModel(name: "test")
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func testsRetrievePublisherSuccess() {
        let expectation = XCTestExpectation(description: "testsRetrievePublisher")
        defer { wait(for: [expectation], timeout: 5) }
        
        let networkManager = MockNetworkSuccessManager(model: mockModel)
        MockUseCase(dataPublisher: networkManager)
            .retrievePublisher(with: nil, method: .get, headers: nil)
            .sink { result in
                switch result {
                case .failure(_):
                    XCTFail()
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { result in
                XCTAssertEqual(self.mockModel, result)
            }
            .store(in: &bag)
    }
    
    func testsRetrievePublisherFailureWithDecodeError() {
        let expectation = XCTestExpectation(description: "testsRetrievePublisherFailureWithDecodeError")
        defer { wait(for: [expectation], timeout: 5) }
        
        let networkManager = MockNetworkSuccessManager(model: mockModel)
        DecodeErrorMockUseCase(dataPublisher: networkManager)
            .retrievePublisher(with: nil, method: .get, headers: nil)
            .sink { result in
                switch result {
                case .failure(let error):
                    XCTAssertEqual(error, UseCaseError.decodeError)
                    expectation.fulfill()
                case .finished:
                    XCTFail()
                }
            } receiveValue: { _ in
            }
            .store(in: &bag)
    }
    
    func testsRetrievePublisherFailureWithNetworkError() {
        let expectation = XCTestExpectation(description: "testsRetrievePublisherFailureWithNetworkError")
        defer { wait(for: [expectation], timeout: 5) }
        
        let networkManager = MockNetworkFailureManager(error: .requestError)
        DecodeErrorMockUseCase(dataPublisher: networkManager)
            .retrievePublisher(with: nil, method: .get, headers: nil)
            .sink { result in
                switch result {
                case .failure(let error):
                    XCTAssertEqual(error, UseCaseError.networkError(NetworkError.requestError))
                    expectation.fulfill()
                case .finished:
                    XCTFail()
                }
            } receiveValue: { _ in
            }
            .store(in: &bag)
    }
}
