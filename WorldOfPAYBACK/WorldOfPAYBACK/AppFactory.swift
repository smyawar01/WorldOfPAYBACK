//
//  AppFactory.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/4/23.
//

import Foundation

public struct AppFactory {
    
    let networkService: NetworkService
    let jsonDecoder: JSONDecoder
    let reachabilityService: ReachabilityService
    
    init() {
        
        URLProtocol.registerClass(MockURLProtocol.self)
        
        let urlConfig = URLSessionConfiguration.default
        urlConfig.protocolClasses?.insert(MockURLProtocol.self, at: 0)
        
        jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        networkService = NetworkSerivceImpl(session: URLSession(configuration: urlConfig),
                                            decoder: jsonDecoder)
        reachabilityService = ReachabilityServiceImpl()
    }
    func makeTransactionListFactory() -> TransactionListFactory {
        
        TransactionListFactory(networkService: networkService,
                               reachabilityService: reachabilityService)
    }
}
