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
        case .error(let error):
            
            Text(error.localizedDescription)
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionListViewModelImpl())
    }
}
