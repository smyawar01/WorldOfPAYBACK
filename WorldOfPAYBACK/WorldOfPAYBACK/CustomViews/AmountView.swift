//
//  AmountView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/30/23.
//

import SwiftUI

struct AmountView: View {
    let amount: String
    var body: some View {
        HStack {
            Text(amount)
                .padding(5)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(5)
                
        }
    }
}

struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView(amount: "\(124) GBP")
    }
}
