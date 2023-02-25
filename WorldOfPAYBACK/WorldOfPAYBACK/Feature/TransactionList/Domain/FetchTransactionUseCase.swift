//
//  FetchTransactionUseCase.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/1/23.
//

import Foundation

public protocol FetchTransactionUseCase {
    
    func execute() async throws -> [TransactionListViewData]
}

public struct FetchTransactionUseCaseImpl: FetchTransactionUseCase {
    
    let repository: TransactionRepository
    let mapper: TransactionListMapper
    
    public func execute() async throws -> [TransactionListViewData] {
        
        do {
            
            let transactions = try await repository.getAll()
            return mapper.map(transactions: transactions)
            
        } catch {
            
            throw TransactionListError.generic
        }
    }
}

public protocol FilterTransactionUseCase {
    
    func execute() -> [TransactionListViewData]
}

public struct FilterTransactionUseCaseImpl: FilterTransactionUseCase {
    
    
    let transactions: [TransactionListViewData]
    let categoryId: Int
    
    public func execute() -> [TransactionListViewData] {
        
        return transactions.filter { $0.category == categoryId  }
    }
}
