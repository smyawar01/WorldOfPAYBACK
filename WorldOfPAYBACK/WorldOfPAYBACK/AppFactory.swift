//
//  AppFactory.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/4/23.
//

import Foundation

public struct AppFactory {
    
    let networkService: NetworkService
    
    init() {
        
        URLProtocol.registerClass(MockURLProtocol.self)
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.protocolClasses?.insert(MockURLProtocol.self, at: 0)
        networkService = NetworkSerivceImpl(session: URLSession(configuration: urlConfig),
                                              decoder: JSONDecoder())
    }
    func makeTransactionListFactory() -> TransactionListFactory {
        
        TransactionListFactory(networkService: networkService)
    }
}
