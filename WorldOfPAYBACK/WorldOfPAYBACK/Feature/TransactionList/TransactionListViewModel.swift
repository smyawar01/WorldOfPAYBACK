//
//  TransactionListViewModel.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import Foundation

protocol TransactionListViewModel {
    
    var viewState: TransactionListViewState? { get }
    func transactions()
}

public final class TransactionListViewModelImpl: TransactionListViewModel {
    
    var viewState: TransactionListViewState?
    private let fetchUseCase: FetchTransactionUseCase
    
    init(fetchUseCase: FetchTransactionUseCase) {
        
        self.fetchUseCase = fetchUseCase
    }
    func transactions() {
        Task {
            
            self.viewState = .loading
            do {
                
                let transactions = try await fetchUseCase.execute()
                self.viewState = .loaded(transactions)
                
            } catch {
                
                if let error = error as? NetworkError {
                    
                    self.viewState = .error(error.localizedDescription)
                }
            }
        }
    }
}

