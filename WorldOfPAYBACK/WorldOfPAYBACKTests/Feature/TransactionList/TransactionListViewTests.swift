//
//  TransactionListViewTests.swift
//  WorldOfPAYBACKTests
//
//  Created by muhammad Yawar on 1/30/23.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import WorldOfPAYBACK

class TransactionListViewTests: XCTestCase {
    
    func test_listView_isLoading() throws {
        
        let vm = TransactionListViewModelStub()
        let view = TransactionListView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        assertSnapshot(matching: vc, as: .image)
    }
    func test_listView_listLoaded() throws {
        
        let vm = TransactionListViewModelStub()
        vm.viewState = .loaded
        let view = TransactionListView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        assertSnapshot(matching: vc, as: .image)
    }
    func test_listView_errorOnLoading() throws {
        
        let vm = TransactionListViewModelStub()
        vm.viewState = .error(TransactionListError.generic.localizedDescription)
        let view = TransactionListView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        assertSnapshot(matching: vc, as: .image)
    }
    private func makeTransactionListViewData() -> [TransactionListViewData] {
        
        return [
            .init(id: UUID(),
                  bookingDate: "2022-07-24T10:59:05",
                  partnerDisplayName: "REWE Group",
                  description: "Punkte sammeln",
                  value: TransactionValue(amount: 124,
                                          currency: "GBP"), category: 1),
            .init(id: UUID(),
                bookingDate: "2022-07-24T10:59:05",
                partnerDisplayName: "REWE Group",
                description: "Punkte sammeln",
                value:
                    TransactionValue(
                        amount: 124,
                        currency: "GBP"), category: 1),
            .init(id: UUID(),
                bookingDate: "2022-07-24T10:59:05",
                partnerDisplayName: "REWE Group",
                description: "Punkte sammeln",
                value:
                    TransactionValue(
                        amount: 124,
                        currency: "GBP"), category: 1)
            ]
    }
}
class TransactionListViewModelStub: TransactionListViewModel {
    var transactions: [WorldOfPAYBACK.TransactionListViewData] = []
    
    func loadTransactions() { }
    
    func refresh() { }
    
    func showCategories() { }

    var viewState: TransactionListViewState?
}

