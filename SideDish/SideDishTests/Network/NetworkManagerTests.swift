//
//  NetworkManagerTests.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/29.
//

@testable import SideDish
import Combine
import XCTest

class NetworkManagerTests: XCTestCase {
    private var networkManager: DataPublishable!
    private var cancelables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func testPublishSueccess() {
        networkManager = MockNetworkSuccessManager(model: Data())
        let expectation = XCTestExpectation(description: "testPublishSueccess")
        
        networkManager.publishDataTask(from: URL(string: ""), method: .get, headers: nil)
            .sink { result in
                switch result {
                case .failure(_):
                    XCTFail()
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { _ in
            }
            .store(in: &cancelables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testPublishFailureWithRequestError() {
        networkManager = MockNetworkFailureManager(error: .requestError)
        let expectation = XCTestExpectation(description: "testPublishFailureWithRequestError")
        
        let url: URL? = nil
        networkManager.publishDataTask(from: url, method: .get, headers: nil)
            .sink { result in
                switch result {
                case .failure(let error):
                    XCTAssertEqual(error, .requestError)
                    expectation.fulfill()
                case .finished:
                    XCTFail()
                }
            } receiveValue: { _ in
            }
            .store(in: &cancelables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testPublishFailureWithInvalidStatusCode() {
        networkManager = MockNetworkFailureManager(error: .invalidStatusCode(404))
        let expectation = XCTestExpectation(description: "testPublishFailureWithInvalidStatusCode")
        
        let url: URL? = URL(string: "https://github.com/HanseopShin")
        networkManager.publishDataTask(from: url, method: .get, headers: nil)
            .sink { result in
                switch result {
                case .failure(let error):
                    switch error {
                    case .invalidStatusCode(let code):
                        XCTAssertEqual(code, 404)
                        expectation.fulfill()
                    default:
                        XCTFail()
                    }
                case .finished:
                    break
                }
            } receiveValue: { _ in
            }
            .store(in: &cancelables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testPublishFailureWithUnkonwnError() {
        networkManager = MockNetworkFailureManager(error: .unknownError(""))
        let expectation = XCTestExpectation(description: "testPublishFailureWithUnkonwnError")
        
        let url: URL? = URL(string: "testtest")
        networkManager.publishDataTask(from: url, method: .get, headers: nil)
            .sink { result in
                switch result {
                case .failure(let error):
                    XCTAssertEqual(error, NetworkError.unknownError("unknown"))
                    expectation.fulfill()
                case .finished:
                    break
                }
            } receiveValue: { _ in
            }
            .store(in: &cancelables)
        
        wait(for: [expectation], timeout: 5.0)
    }
}
