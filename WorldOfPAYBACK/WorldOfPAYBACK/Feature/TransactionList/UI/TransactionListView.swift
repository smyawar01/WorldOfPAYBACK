//
//  TransactionListView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import SwiftUI

struct TransactionListView: View {
    
    var viewModel: TransactionListViewModel
    var body: some View {
        
        switch viewModel.viewState {
            
        case .loading:
            
            CustomLoader()
        case .loaded(let transactions):
            
            List(transactions, id: \.id) {
                
                TransactionListItemView(transaction: $0)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparatorTint(.gray)
                
            }
        case .error(let message):
            
            Text(message)
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let vm = AppFactory().makeTransactionListFactory().makeViewModel()
        TransactionListView(viewModel: vm)
    }
}
