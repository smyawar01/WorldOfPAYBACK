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
    func transactions()
}

public final class TransactionListViewModelImpl: TransactionListViewModel {
    
    @Published var viewState: TransactionListViewState? = .noInternet
    private let fetchUseCase: FetchTransactionUseCase
    private let reachabilityService: ReachabilityService
    private var cancellables: Set<AnyCancellable> = []
    
    init(fetchUseCase: FetchTransactionUseCase, reachabilityService: ReachabilityService) {
        
        self.fetchUseCase = fetchUseCase
        self.reachabilityService = reachabilityService
        self.bind()
    }
    public func transactions() {
        
        guard self.viewState != .noInternet else { return }
        Task {
            await update(state: .loading)
            do {
                
                let transactions = try await fetchUseCase.execute()
                await update(state: .loaded(transactions))
                
            } catch {
                
                await self.handleError(error: error)
            }
        }
    }
}

extension TransactionListViewModelImpl {
    
    @MainActor
    private func update(state: TransactionListViewState) {
        
        self.viewState = state
    }
    private func handleError(error: Error) async {
        
        guard let error = error as? TransactionListError else {
            
            return
        }
        if case .deviceOffline = error {
            
            await update(state: .noInternet)
        } else {
            
            await update(state: .error(error.localizedDescription))
        }
    }
    private func bind() {
        
        self.reachabilityService.connectionStatusPublisher.sink { status in
            
            Task {
                
                print("bind: \(status)")
                await self.update(state: status == .offline ? .noInternet : .internet)
            }
        }
        .store(in: &cancellables)
    }
}

