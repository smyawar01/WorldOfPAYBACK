//
//  FetchTransactionUseCase.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/1/23.
//

import Foundation

protocol FetchTransactionUseCase {
    
    func execute() async throws -> [TransactionListViewData]
}

public struct FetchTransactionUseCaseImpl: FetchTransactionUseCase {
    
    let repository: TransactionRepository
    let mapper: TransactionListMapper
    
    func execute() async throws -> [TransactionListViewData] {
        
        let transactions = try await repository.getAll()
        return mapper.map(transactions: transactions)
    }
}
