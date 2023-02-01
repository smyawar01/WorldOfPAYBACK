//
//  Transaction.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/1/23.
//

import Foundation

struct Transaction: Decodable {
    
    let partnerDisplayName: String
    let category: Int
    let alias: Alias
    let transactionDetail: TransactionDetail
}

struct Alias: Decodable {
    
    let reference: Int
}
