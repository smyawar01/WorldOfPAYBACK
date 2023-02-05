//
//  TransactionListViewState.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import Foundation

enum TransactionListViewState {
    
    case loading
    case loaded([TransactionListViewData])
    case error(String)
}

