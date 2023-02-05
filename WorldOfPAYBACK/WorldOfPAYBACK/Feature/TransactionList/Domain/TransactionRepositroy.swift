//
//  TransactionRepositroy.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/1/23.
//

import Foundation

public protocol TransactionRepository {
    
    func getAll() async throws -> [Transaction]
}

public struct TransactionRepositoryImpl: TransactionRepository {
    
    let networkService: NetworkService
    public func getAll() async throws -> [Transaction] {
        
        let transaction: TransactionListResponse = try await networkService.execute(url: URL(string: "https://api-test.payback.com/transactions")!)
        return transaction.items
    }
}
