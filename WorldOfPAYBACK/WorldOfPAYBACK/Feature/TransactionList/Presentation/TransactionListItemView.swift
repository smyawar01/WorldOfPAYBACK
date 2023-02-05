//
//  TransactionListItemView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/30/23.
//

import SwiftUI

struct TransactionListItemView: View {
    
    let transaction: TransactionListViewData
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 10) {
                
                TitleView(title: transaction.partnerDisplayName)
                Text(transaction.description)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {

                Text(transaction.bookingDate)
                    .foregroundColor(.white)
                AmountView(amount: "\(transaction.value.amount) \(transaction.value.currency)")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.black)
    }
}

struct TransactionListItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        let transaction = TransactionListViewData(id: UUID(),
                                bookingDate: "2022-07-24T10:59:05",
                                partnerDisplayName: "REWE Group",
                                description: "Punkte sammeln",
                                value:
                                    TransactionValue(
                                        amount: 124,
                                        currency: "GBP"))
        TransactionListItemView(transaction: transaction)
    }
}
