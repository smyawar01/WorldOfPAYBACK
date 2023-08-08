//
//  TransactionListView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import SwiftUI

struct TransactionListView<ViewModel: TransactionListViewModel>: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        
        self.viewModel = viewModel
    }
    var body: some View {
        
        ZStack {
            Color("BackgroundPrimary").ignoresSafeArea()
            VStack {
                if case .noInternet = viewModel.viewState {

                    NoConnectionView()
                    .frame(height: 60)
                    Spacer()
                }
                TransactionListHeader(amount: "0.0") {
                    
                    self.viewModel.showCategories()
                }
                ListView(items: self.viewModel.transactions) {
                    
                    TransactionListItemView(transaction: $0)
                }
                .refreshable { self.viewModel.refresh() }
            }
        }
        .overlay(content: {

            if case .loading = self.viewModel.viewState { CustomLoader() }
            else if case let .showCategories(categories) = self.viewModel.viewState {
                
                CategoryView(categories: categories) { _ in }
            }
        })
        .navigationTitle(NSLocalizedString("Transactions",
                                           comment: "Navigation Title"))
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let vm = AppFactory().makeTransactionListFactory().makeViewModel()
        TransactionListView(viewModel: vm)
    }
}
