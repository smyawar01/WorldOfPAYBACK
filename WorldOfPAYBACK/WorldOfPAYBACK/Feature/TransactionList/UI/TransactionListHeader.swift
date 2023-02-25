//
//  TransactionListHeader.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/25/23.
//

import SwiftUI

struct TransactionListHeader: View {
    
    let amount: String
    let action: (() -> ())
    var body: some View {
        VStack {
            Divider()
                .background(Color("ObjectSecondary"))
                .frame(height: 1)
            HStack {
                Button {
                    action()
                } label: {
                    
                    Text("Category")
                }
                .padding()
                Spacer()
                Text("\(amount)")
                    .padding()
                    .foregroundColor(Color("TextSecondary"))
            }
            .background(Color("BackgroundSecondary"))
            Divider()
                .background(Color("ObjectSecondary"))
                .frame(height: 1)
        }
    }
}

struct TransactionListHeader_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListHeader(amount: "0.0") {
            
            print("Clicked")
        }
    }
}
