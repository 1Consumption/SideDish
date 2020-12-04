//
//  RetrievePublisherable.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/29.
//

import Combine
import Foundation

protocol RetrievePublisherable where T: Decodable {
    associatedtype T
    var dataPublisher: DataPublishable { get }
    
    func retrievePublisher(with url: URL?, method: HTTPMethod, headers: HTTPHeaders?) -> AnyPublisher<T, UseCaseError>
}

extension RetrievePublisherable {
    func retrievePublisher(with url: URL?, method: HTTPMethod, headers: HTTPHeaders?) -> AnyPublisher<T, UseCaseError> {
        return dataPublisher.publishDataTask(from: url, method: method, headers: headers)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error -> UseCaseError in
                if let networkError = error as? NetworkError {
                    return UseCaseError.networkError(networkError)
                }
                
                return .decodeError
            })
            .eraseToAnyPublisher()
    }
}
