//
//  TransactionListViewModel.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import Foundation

protocol TransactionListViewModel {
    
    var viewState: TransactionListViewState { get }
}

public final class TransactionListViewModelImpl: TransactionListViewModel {
    
    var viewState: TransactionListViewState = .loading
    private let fetchUseCase: FetchTransactionUseCase
    
    init(fetchUseCase: FetchTransactionUseCase) {
        
        self.fetchUseCase = fetchUseCase
    }
}

