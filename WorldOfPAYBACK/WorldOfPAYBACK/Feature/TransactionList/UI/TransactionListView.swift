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
                if viewModel.viewState == .noInternet {

                    NoConnectionView()
                    .frame(height: 60)
                    Spacer()
                }
                TransactionListHeader(amount: "0.0") {
                    
                    self.viewModel.showCategories()
                }
                ListView(items: self.viewModel.transactions) {
                    
                    TransactionListItemView(transaction: $0)
                } onRefresh: {
                    
                    self.viewModel.refresh()
                }
            }
        }
        .overlay(content: {

            if self.viewModel.viewState == .loading {

                CustomLoader()
            } else if case let .categories(categories) = self.viewModel.viewState {
                
                
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
