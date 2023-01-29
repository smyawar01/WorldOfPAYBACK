//
//  TransactionListViewModel.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import Foundation

protocol TransactionListViewModel {
    
    var viewState: TransactionListViewState { get }
}

struct TransactionListViewModelImpl: TransactionListViewModel {
    
    var viewState: TransactionListViewState = .loading
}
