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
            .font(.title3)
            .padding(Theme.Spacing.base)
            .frame(maxWidth: .infinity)
            .background(Color.green)
    }
}

struct NoConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoConnectionView()
    }
}
