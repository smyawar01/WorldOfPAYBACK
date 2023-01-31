//
//  FetchTransactionUseCase.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/1/23.
//

import Foundation

protocol FetchTransactionUseCase {
    
    func execute() async -> [TransactionListViewData]
}

public struct FetchTransactionUseCaesImpl: FetchTransactionUseCase {
    
    func execute() async -> [TransactionListViewData] {
        
        return []
    }
}
