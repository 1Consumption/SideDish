//
//  DishUseCase.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/29.
//

import Combine
import Foundation

struct DishUseCase: RetrievePublisherable {
    typealias T = DishResponse
    
    let dataPublisher: DataPublishable
    
    init(dataPublisher: DataPublishable) {
        self.dataPublisher = dataPublisher
    }
    
    func retrieveDishPublisher(with category: DishCategory) -> AnyPublisher<T, UseCaseError> {
        let url: URL?
        
        switch category {
        case .main:
            url = EndPoint.init(path: .main).url
        case .side:
            url = EndPoint.init(path: .side).url
        case .soup:
            url = EndPoint.init(path: .soup).url
        }
        
        return retrievePublisher(with: url, method: .get, headers: nil)
    }
}
