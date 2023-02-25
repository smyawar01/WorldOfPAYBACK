//
//  TransactionListViewState.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import Foundation

enum TransactionListViewState: Equatable {
    case loading
    case loaded
    case error(String)
    case internet
    case noInternet
    case categories([Int])
}

extension TransactionListViewState {
    
    static func == (lhs: TransactionListViewState, rhs: TransactionListViewState) -> Bool {
        
        switch (lhs, rhs) {
        
        case (.loading, .loading):
            return true
        case (.loaded, .loaded):
            return true
        case (.error(_), .error(_)):
            return true
        case (.noInternet, .noInternet):
            return true
        default:
            return false
        }
    }
}

