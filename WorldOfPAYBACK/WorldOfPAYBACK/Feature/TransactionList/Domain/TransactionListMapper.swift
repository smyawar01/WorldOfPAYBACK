//
//  TransactionListMapper.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/4/23.
//

import Foundation

public protocol TransactionListMapper {
    
    func map(transactions: [Transaction]) -> [TransactionListViewData]
}

public struct TransactionListMapperImpl: TransactionListMapper {
    
    let dateFormatter: DateFormatter
    public func map(transactions: [Transaction]) -> [TransactionListViewData] {
        
        self.dateFormatter.dateFormat = "MMM dd, yyyy"
        
        return transactions.sorted { (trans0, trans1) in
            
            trans0.transactionDetail.bookingDate >
            trans1.transactionDetail.bookingDate
        }
        .map { transaction in
            
            return TransactionListViewData(id: UUID(),
                                           bookingDate: self.dateFormatter.string(from: transaction.transactionDetail.bookingDate),
                                           partnerDisplayName: transaction.partnerDisplayName,
                                           description: transaction.transactionDetail.description ?? "N/A",
                                           value: transaction.transactionDetail.value)
        }
    }
}
