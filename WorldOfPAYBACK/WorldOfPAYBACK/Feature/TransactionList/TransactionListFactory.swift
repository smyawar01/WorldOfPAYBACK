//
//  TransactionListFactory.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/4/23.
//

import Foundation

public struct TransactionListFactory {
    
    let networkService: NetworkService
    
    func makeViewModel() -> some TransactionListViewModel {
        
        TransactionListViewModelImpl(fetchUseCase: makeFetchUseCase())
    }
}

private extension TransactionListFactory {
    
    private func makeFetchUseCase() -> FetchTransactionUseCase {
        
        FetchTransactionUseCaseImpl(repository: makeRepository(),
                                    mapper: makeMapper())
    }
    private func makeRepository() -> TransactionRepository {
        
        TransactionRepositoryImpl(networkService: self.networkService)
    }
    private func makeMapper() -> TransactionListMapper {
        
        TransactionListMapperImpl(dateFormatter: DateFormatter())
    }
}
