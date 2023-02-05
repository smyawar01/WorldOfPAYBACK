//
//  TransactionListResponse.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/5/23.
//

import Foundation

public struct TransactionListResponse: Decodable {
    
    let items: [Transaction]
}
