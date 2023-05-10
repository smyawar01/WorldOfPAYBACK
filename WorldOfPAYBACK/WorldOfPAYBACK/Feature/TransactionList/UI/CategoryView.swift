//
//  CategoryView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 3/2/23.
//

import SwiftUI

struct CategoryView: View {
    
    private let categories: [any Identifiable]
    var body: some View {
        
        ListView(items: categories) { Text("\($0)") }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
