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
                List(viewModel.transactions, id: \.id) {
                    TransactionListItemView(transaction: $0)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparatorTint(.gray)
                }
                .listStyle(.plain)
                .refreshable {

                    viewModel.refresh()
                }
                .onAppear {
                    
                    UIRefreshControl.appearance().tintColor = UIColor(named: "ObjectSecondary")
                }
            }
        }
        .overlay(content: {

            if self.viewModel.viewState == .loading {

                CustomLoader()
            } else if case let .categories(categories) = self.viewModel.viewState {
                
                List(categories, id: \.self) { category in
                    
                    Text("\(category)")
                }
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
