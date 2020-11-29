//
//  NetworkManager.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/29.
//

import Combine
import Foundation

protocol DataPublishable {
    func publishDataTask(from url: URL?, method: HTTPMethod, headers: HTTPHeaders?) -> AnyPublisher<Data, NetworkError>
}

struct NetworkManager: DataPublishable {
    func publishDataTask(from url: URL?, method: HTTPMethod, headers: HTTPHeaders?) -> AnyPublisher<Data, NetworkError> {
        guard let urlRequest = makeURLRequest(url: url, method: method, headers: headers) else {
            return Fail(error: NetworkError.requestError)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.notHTTPResponse
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.invalidStatusCode(httpResponse.statusCode)
                }
                
                return data
            }
            .mapError { error -> NetworkError in
                if let error = error as? NetworkError {
                    return error
                }
                
                return .unknownError(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
    
    private func makeURLRequest(url: URL?, method: HTTPMethod, headers: HTTPHeaders?) -> URLRequest? {
        guard let url = url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        headers?.list.forEach { field, value in
            urlRequest.addValue(value, forHTTPHeaderField: field)
        }
        
        return urlRequest
    }
}
