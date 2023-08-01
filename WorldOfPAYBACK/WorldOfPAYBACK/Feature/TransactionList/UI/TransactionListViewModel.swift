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
    func showCategories()
}

public final class TransactionListViewModelImpl: TransactionListViewModel {
    
    @Published var viewState: TransactionListViewState? = .noInternet
    var transactions: [TransactionListViewData] = []
    private let fetchUseCase: FetchTransactionUseCase
    private let filterUseCase: FilterTransactionUseCase
    private let reachabilityService: ReachabilityService
    private var cancellables: Set<AnyCancellable> = []
    
    init(fetchUseCase: FetchTransactionUseCase,
         filterUseCase: FilterTransactionUseCase,
         reachabilityService: ReachabilityService) {
        
        self.fetchUseCase = fetchUseCase
        self.filterUseCase = filterUseCase
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
    public func showCategories() {
        
        Task { await self.update(state: .showCategories(self.filterCategories())) }
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
        
        guard let error = error as? TransactionListError else { return }
        await update(state: .error(error.localizedDescription))
    }
    private func bind() {
        
        self.reachabilityService.connectionStatus.sink { [weak self] status in
            
            guard let self else { return }
            Task {
                
                print(status)
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
    private func filterCategories() -> [Category] {
        
        return self.transactions
            .compactMap { Category(type: $0.category, id: UUID()) }
            .distinct()
            .sorted()
    }
}

