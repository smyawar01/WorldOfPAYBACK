//
//  TransactionRepositroy.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/1/23.
//

import Foundation

protocol TransactionRepository {
    
    func getAll() async -> Result<[Transaction], Error>
}

public struct TransactionRepositoryImpl: TransactionRepository {
    
    let networkService: NetworkService
    func getAll() async -> Result<[Transaction], Error> {
        
        return .success([])
    }
}
