//
//  TransactionListView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import SwiftUI

struct TransactionListView: View {
    
    let viewModel: TransactionListViewModel
    var body: some View {
        
        ZStack {
            
            if viewModel.viewState == .loading {
                
                CustomLoader()
            }
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionListViewModelImpl())
    }
}
