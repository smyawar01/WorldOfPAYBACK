//
//  TransactionListViewModel.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import Foundation

protocol TransactionListViewModel: ObservableObject {
    
    var viewState: TransactionListViewState? { get set }
    func transactions()
}

public final class TransactionListViewModelImpl: TransactionListViewModel {
    
    @Published var viewState: TransactionListViewState?
    private let fetchUseCase: FetchTransactionUseCase
    
    init(fetchUseCase: FetchTransactionUseCase) {
        
        self.fetchUseCase = fetchUseCase
    }
    public func transactions() {
        Task {
            
            await self.update(state: .loading)
            do {
                
                let transactions = try await fetchUseCase.execute()
                await self.update(state: .loaded(transactions))
                
            } catch { await self.update(state: .error(error.localizedDescription)) }
        }
    }
}

extension TransactionListViewModel {
    
    @MainActor
    func update(state: TransactionListViewState) {
        
        self.viewState = state
    }
}

