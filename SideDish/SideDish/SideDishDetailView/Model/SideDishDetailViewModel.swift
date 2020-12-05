//
//  SideDishDetailViewModel.swift
//  SideDish
//
//  Created by 신한섭 on 2020/12/05.
//

import Combine
import Foundation

final class SideDishDetailViewModel: ObservableObject {
    @Published var sideDishDetail: SideDishDetail?
    @Published var isErrorOccured: Bool = false
    private(set) var errorMessage: String = ""
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let useCase: SideDishDetailUseCase
    
    init(dataPublisher: DataPublishable = NetworkManager()) {
        useCase = SideDishDetailUseCase(dataPublisher: dataPublisher)
    }
    
    func retrieveSideDishDetail(with key: String) {
        useCase.retrieveSideDishDetailPublihser(with: key)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard case .failure(let error) = state else { return }
                self?.isErrorOccured = true
                self?.errorMessage = error.errorMessage
            } receiveValue: { [weak self] detail in
                self?.sideDishDetail = detail
            }
            .store(in: &bag)
    }
}
