//
//  TitleView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/30/23.
//

import SwiftUI

struct TitleView: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.white)
            .bold()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "M Yawar")
    }
}
