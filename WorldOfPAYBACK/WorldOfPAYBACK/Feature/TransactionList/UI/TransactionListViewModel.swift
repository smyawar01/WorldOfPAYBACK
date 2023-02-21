//
//  TransactionListViewModel.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import Foundation
import Combine

protocol TransactionListViewModel: ObservableObject {
    
    var viewState: TransactionListViewState? { get set }
    var transactions: [TransactionListViewData] { get }
    func loadTransactions()
    func refresh()
}

public final class TransactionListViewModelImpl: TransactionListViewModel {
    
    @Published var viewState: TransactionListViewState? = .noInternet
    var transactions: [TransactionListViewData] = []
    private let fetchUseCase: FetchTransactionUseCase
    private let reachabilityService: ReachabilityService
    private var cancellables: Set<AnyCancellable> = []
    
    init(fetchUseCase: FetchTransactionUseCase, reachabilityService: ReachabilityService) {
        
        self.fetchUseCase = fetchUseCase
        self.reachabilityService = reachabilityService
        self.bind()
    }
    public func loadTransactions() {
        
        if self.shouldLoadTransaction() {
            
            self.getTransactions()
        }
    }
    public func refresh() {
        
        self.loadTransactions()
    }
}

extension TransactionListViewModelImpl {
    
    @MainActor
    private func update(state: TransactionListViewState) {
        
        self.viewState = state
    }
    private func getTransactions() {
        Task {
            await update(state: .loading)
            do {
                
                self.transactions = try await fetchUseCase.execute()
                await update(state: .loaded)
                
            } catch {
                
                await self.handleError(error: error)
            }
        }
    }
    private func handleError(error: Error) async {
        
        guard let error = error as? TransactionListError else {
            
            return
        }
        await update(state: .error(error.localizedDescription))
    }
    private func bind() {
        
        self.reachabilityService.connectionStatusPublisher.sink { [weak self] status in
            
            guard let self = self else { return }
            Task {
                
                await self.update(state: status == .offline ? .noInternet : .internet)
                if status == .online && self.transactions.isEmpty {
                    
                    self.getTransactions()
                }
            }
        }
        .store(in: &cancellables)
    }
    private func shouldLoadTransaction() -> Bool {
        
        return self.viewState == .internet && self.viewState != .loading
    }
}

