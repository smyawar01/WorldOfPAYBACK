//
//  ListView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/28/23.
//

import SwiftUI

struct ListView<Element: Identifiable, RowContent: View>: View {
    
    private let items: [Element]
    private let rowContent: ((Element) -> RowContent)
    
    init(items: [Element],
         @ViewBuilder rowContent: @escaping (Element) -> RowContent) {
        self.items = items
        self.rowContent = rowContent
    }
    
    var body: some View {
        
        List(items, id: \.id, rowContent: rowContent)
        .listStyle(.plain)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let transaction = TransactionListViewData(id: UUID(),
                                                  bookingDate: "2022-07-24T10:59:05",
                                                  partnerDisplayName: "REWE Group",
                                                  description: "Punkte sammeln",
                                                  value:
                                                    TransactionValue(
                                                        amount: 124,
                                                        currency: "GBP"),
                                                  category: 1)
        ListView<TransactionListViewData, TransactionListItemView>(items: [transaction]) { TransactionListItemView(transaction: $0)
        }
    }
}
