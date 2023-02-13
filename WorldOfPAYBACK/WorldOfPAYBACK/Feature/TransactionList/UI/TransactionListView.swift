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
        viewModel.transactions()
    }
    var body: some View {
        
        VStack {
            
            if viewModel.viewState == .noInternet  {
                
                NoConnectionView()
            }
            Spacer()
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
            default:
                
                Text("Missing data.....")
            }
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let vm = AppFactory().makeTransactionListFactory().makeViewModel()
        TransactionListView(viewModel: vm)
            .preferredColorScheme(.light)
    }
}