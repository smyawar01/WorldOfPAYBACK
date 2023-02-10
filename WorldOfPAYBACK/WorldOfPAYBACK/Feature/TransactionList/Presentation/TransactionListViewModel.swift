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
            
            await update(state: .loading)
            do {
                
                let transactions = try await fetchUseCase.execute()
                await update(state: .loaded(transactions))
                
            } catch {
                
                guard let error = error as? TransactionListError else {
                    
                    return
                }
                if case .deviceOffline = error {
                    
                    await update(state: .noInternet)
                } else {
                    
                    await update(state: .error(error.localizedDescription))
                }
            }
        }
    }
}

private extension TransactionListViewModel {
    
    @MainActor
    func update(state: TransactionListViewState) {
        
        self.viewState = state
    }
    func handleError(error: TransactionListError) async
    {
            
            await self.update(state: .error(error.localizedDescription))
    }
}

