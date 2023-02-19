//
//  TransactionListError.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/6/23.
//

import Foundation

enum TransactionListError: Error {
    
    case generic
}

extension TransactionListError {
    
    var localizedDescription: String {
        
        switch self {
            
        case .generic:
            return "Something went wrong. Please try again."
        }
    }
}
