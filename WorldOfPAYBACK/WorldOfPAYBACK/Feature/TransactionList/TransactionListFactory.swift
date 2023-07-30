//
//  TransactionListFactory.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/4/23.
//

import Foundation
import Network

public final class TransactionListFactory {
    
    let networkService: NetworkService
    var reachabilityService: ReachabilityService
    
    init(networkService: NetworkService, reachabilityService: ReachabilityService) {
        
        self.networkService = networkService
        self.reachabilityService = reachabilityService
    }
    
    func makeViewModel() -> some TransactionListViewModel {
        
        TransactionListViewModelImpl(fetchUseCase: makeFetchUseCase(),
                                     filterUseCase: makeFilterUseCase(),
                                     reachabilityService: self.reachabilityService)
    }
}

private extension TransactionListFactory {
    
    private func makeFetchUseCase() -> FetchTransactionUseCase {
        
        FetchTransactionUseCaseImpl(repository: makeRepository(), mapper: makeMapper())
    }
    private func makeFilterUseCase() -> FilterTransactionUseCase {
        
        FilterTransactionUseCaseImpl(transactions: [], categoryId: 1)
    }
    private func makeRepository() -> TransactionRepository { TransactionRepositoryImpl(networkService: self.networkService) }
    private func makeMapper() -> TransactionListMapper { TransactionListMapperImpl(dateFormatter: DateFormatter()) }
    private func makeReachability() -> some ReachabilityService { ReachabilityServiceImpl() }
}
