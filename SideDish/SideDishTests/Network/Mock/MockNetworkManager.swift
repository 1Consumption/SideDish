//
//  MockNetworkManager.swift
//  SideDishTests
//
//  Created by 신한섭 on 2020/11/29.
//

@testable import SideDish
import Combine
import Foundation

struct MockNetworkSuccessManager<T>: DataPublishable where T: Codable {
    var data: Data
    
    init(model: T) {
        let encoder = JSONEncoder()
        let result = try! encoder.encode(model)
        data = result
    }
    
    func publishDataTask(from url: URL?, method: HTTPMethod, headers: HTTPHeaders?) -> AnyPublisher<Data, NetworkError> {
        return Just(data)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}

struct MockNetworkFailureManager: DataPublishable {
    let error: NetworkError
    
    init(error: NetworkError) {
        self.error = error
    }
    
    func publishDataTask(from url: URL?, method: HTTPMethod, headers: HTTPHeaders?) -> AnyPublisher<Data, NetworkError> {
        switch error {
        case .invalidStatusCode(let code):
            return Fail(error: NetworkError.invalidStatusCode(code))
                .eraseToAnyPublisher()
        case .notHTTPResponse:
            return Fail(error: NetworkError.notHTTPResponse)
                .eraseToAnyPublisher()
        case .requestError:
            return Fail(error: NetworkError.requestError)
                .eraseToAnyPublisher()
        case .unknownError(_):
            return Fail(error: NetworkError.unknownError("" ))
                .eraseToAnyPublisher()
        }
    }
}
