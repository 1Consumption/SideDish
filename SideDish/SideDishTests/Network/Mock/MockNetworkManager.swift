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
    private let data: Data
    
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

struct MockDishDataPublisher<T>: DataPublishable where T: Encodable {
    private let data1: Data
    private let data2: Data
    private let data3: Data
    private let queue: DispatchQueue = DispatchQueue(label: "Mockqueue.com")
    init(model1: T, model2: T, model3: T) {
        let encoder = JSONEncoder()
        let model1Encoded = try! encoder.encode(model1)
        let model2Encoded = try! encoder.encode(model2)
        let model3Encoded = try! encoder.encode(model3)
        
        data1 = model1Encoded
        data2 = model2Encoded
        data3 = model3Encoded
    }
    
    func publishDataTask(from url: URL?, method: HTTPMethod, headers: HTTPHeaders?) -> AnyPublisher<Data, NetworkError> {
        switch url {
        case EndPoint.init(path: .main).url:
            return Future { promise in
                queue.asyncAfter(deadline: .now() + 3) {
                    promise(.success(data1))
                }
            }.eraseToAnyPublisher()
        case EndPoint.init(path: .soup).url:
            return Future { promise in
                queue.asyncAfter(deadline: .now() + 2) {
                    promise(.success(data2))
                }
            }.eraseToAnyPublisher()
        case EndPoint.init(path: .side).url:
            return Future { promise in
                queue.asyncAfter(deadline: .now() + 4) {
                    promise(.success(data3))
                }
            }.eraseToAnyPublisher()
        default:
            return Fail(error: NetworkError.requestError)
                .eraseToAnyPublisher()
        }
    }
}

struct MockNetworkFailureManager: DataPublishable {
    private let error: NetworkError
    
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
