//
//  CategoryView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 3/2/23.
//

import SwiftUI

struct CategoryView: View {
    
    private let categories: [Category]
    init(categories: [Category]) {
        self.categories = categories
    }
    var body: some View {
        
        ListView(items: categories) { Text($0.name) }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        let categories: [Category] = [Category(name: "1", id: UUID())]
        CategoryView(categories: categories)
    }
}
