//
//  TransactionRepositroy.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/1/23.
//

import Foundation

protocol TransactionRepository {
    
    func getAll() async throws -> [Transaction]
}

public struct TransactionRepositoryImpl: TransactionRepository {
    
    let networkService: NetworkService
    func getAll() async throws -> [Transaction] {
        
        let transaction: [Transaction] = try await networkService.execute(url: URL(string: "")!)
        return transaction
    }
}
