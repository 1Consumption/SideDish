//
//  SideDishDetailUseCase.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/05.
//

import Combine
import Foundation

struct SideDishDetailUseCase: RetrievePublisherable {
    typealias T = SideDishDetail
    
    let dataPublisher: DataPublishable
    
    init(dataPublisher: DataPublishable) {
        self.dataPublisher = dataPublisher
    }
    
    func retrieveSideDishDetailPublihser(with key: String) -> AnyPublisher<T, UseCaseError> {
        let url = EndPoint.init(path: .detail(key)).url
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return retrievePublisher(with: url, method: .get, headers: nil, decoder: decoder)
    }
}
