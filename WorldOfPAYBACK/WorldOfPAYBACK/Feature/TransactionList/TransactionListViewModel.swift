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

public final class TransactionListViewModelImpl: TransactionListViewModel {
//    var viewState: TransactionListViewState = .loaded([
//
//        TransactionListViewData(id: UUID(),
//                                bookingDate: "2022-07-24T10:59:05",
//                                partnerDisplayName: "REWE Group",
//                                description: "Punkte sammeln",
//                                value:
//                                    TransactionValue(
//                                        amount: 124,
//                                        currency: "GBP")),
//        TransactionListViewData(id: UUID(),
//                                bookingDate: "2022-07-24T10:59:05",
//                                partnerDisplayName: "REWE Group",
//                                description: "Punkte sammeln",
//                                value:
//                                    TransactionValue(
//                                        amount: 124,
//                                        currency: "GBP")),
//        TransactionListViewData(id: UUID(),
//                                bookingDate: "2022-07-24T10:59:05",
//                                partnerDisplayName: "REWE Group",
//                                description: "Punkte sammeln",
//                                value:
//                                    TransactionValue(
//                                        amount: 124,
//                                        currency: "GBP"))
//    ])
    
    var viewState: TransactionListViewState = .error(AppConstants.APIError.genericMessage)
}
