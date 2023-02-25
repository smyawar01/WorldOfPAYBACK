//
//  TransactionValue.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/30/23.
//

import Foundation

struct TransactionValue: Decodable, Hashable {
    
    let amount: Double
    let currency: String
}
