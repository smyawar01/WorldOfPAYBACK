//
//  NoConnectionView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/10/23.
//

import SwiftUI

struct NoConnectionView: View {
    var body: some View {
        
            Text("No internet connection....")
            .frame(height: 45)                .font(.title3)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("TextPrimary"))
                .background(Color.green)

    }
}

struct NoConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoConnectionView()
            .preferredColorScheme(.dark)
    }
}
