//
//  SideDishViewModel.swift
//  SideDish
//
//  Created by 신한섭 on 2020/11/30.
//

import Combine
import Foundation

final class SideDishViewModel: ObservableObject {
    @Published var state: SubscribeState = .yet
    private(set) var sideDish: [DishWithTitle] = [DishWithTitle]()
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let useCase: DishUseCase
    
    init(dataPublisher: DataPublishable = NetworkManager()) {
        useCase = DishUseCase(dataPublisher: dataPublisher)
    }
    
    enum SubscribeState {
        case yet
        case failure(UseCaseError)
        case done
    }

    func retrieveDish() {
        let main = dishPublisher(with: .main)
        let soup = dishPublisher(with: .soup)
        let side = dishPublisher(with: .side)
        
        Publishers.Zip3(main, soup, side)
            .sink { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.state = .failure(error)
                case .finished:
                    self?.state = .done
                }
            } receiveValue: { [weak self] value in
                self?.sideDish.append(value.0)
                self?.sideDish.append(value.1)
                self?.sideDish.append(value.2)
            }
            .store(in: &bag)
    }
    
    private func dishPublisher(with category: DishCategory) -> AnyPublisher<DishWithTitle, UseCaseError> {
        return useCase.retrieveDishPublisher(with: category)
            .map{ DishWithTitle(title: category.title,
                                subTitle: category.subTitle,
                                dish: $0.body) }
            .eraseToAnyPublisher()
    }
}
