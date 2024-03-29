//
//  TransactionDetail.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/1/23.
//

import Foundation

struct TransactionDetail: Decodable {
    
    let description: String?
    let bookingDate: Date
    let value: TransactionValue
}
