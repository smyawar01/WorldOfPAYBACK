//
//  TransactionListViewData.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import Foundation

struct TransactionListViewData: Identifiable {
    let id: UUID
    let bookingDate: String
    let partnerDisplayName: String
    let description: String
    let value: TransactionValue
}
