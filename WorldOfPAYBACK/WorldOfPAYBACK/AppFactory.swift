//
//  AppFactory.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/4/23.
//

import Foundation

public struct AppFactory {
    
    let networkService = NetworkSerivceImpl(session: URLSession(configuration: URLSessionConfiguration.default),
                                            decoder: JSONDecoder())
    func makeTransactionListFactory() -> TransactionListFactory {
        
        TransactionListFactory(networkService: networkService)
    }
}
