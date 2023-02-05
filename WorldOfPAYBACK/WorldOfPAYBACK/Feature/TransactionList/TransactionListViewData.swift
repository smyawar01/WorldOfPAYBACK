//
//  TransactionListViewData.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import Foundation

public struct TransactionListViewData: Identifiable {
    
    public let id: UUID
    let bookingDate: String
    let partnerDisplayName: String
    let description: String
    let value: TransactionValue
}
