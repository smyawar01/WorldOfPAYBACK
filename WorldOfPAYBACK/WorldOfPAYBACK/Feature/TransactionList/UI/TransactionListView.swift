//
//  TransactionListView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import SwiftUI

struct TransactionListView<ViewModel: TransactionListViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
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
                List(viewModel.transactions, id: \.id) {
                    TransactionListItemView(transaction: $0)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparatorTint(.gray)
                }
                .listStyle(.plain)
                .refreshable {

                    viewModel.refresh()
                }
            }
        }
        .overlay(content: {

            if viewModel.viewState == .loading {

                CustomLoader()
            }
        })
        .navigationTitle(NSLocalizedString("Transactions", comment: "Navigation Title"))
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let vm = AppFactory().makeTransactionListFactory().makeViewModel()
        TransactionListView(viewModel: vm)
    }
}
