//
//  TransactionRepositroy.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/1/23.
//

import Foundation

enum ConnectivityError: Error {
    
    case noInternet
}

public protocol TransactionRepository {
    
    func getAll() async throws -> [Transaction]
}

public struct TransactionRepositoryImpl<Reachability: ReachabilityService>: TransactionRepository {
    
    let networkService: NetworkService
    var reachability: Reachability
    
    public func getAll() async throws -> [Transaction] {
        
        if reachability.reachabilityStatus == .online {
            
            let transaction: TransactionListResponse = try await networkService.execute(url: URL(string: "https://api-test.payback.com/transactions")!)
            return transaction.items
            
        } else {
            
            throw ConnectivityError.noInternet
        }
    }
}
