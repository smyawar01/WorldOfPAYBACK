//
//  CategoryView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 3/2/23.
//

import SwiftUI

struct CategoryView: View {
    
    private let categories: [Category]
    private let onSelection: ((Category) -> Void)
    init(categories: [Category], onSelection: @escaping (Category) -> Void) {
        self.categories = categories
        self.onSelection = onSelection
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: Theme.Spacing.expanded) {
            
            Button {
                
            } label: {
                Image(systemName: "xmark")
            }
            .padding(Theme.Spacing.expanded)
            ListView(items: categories) { Text("\($0.type)") }
        }
        .background(content: {
            Color(uiColor: .lightGray)
        })
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        let categories: [Category] = [Category(type: 1, id: UUID()),
                                      Category(type: 1, id: UUID()),
                                      Category(type: 2, id: UUID())]
        CategoryView(categories: categories.distinct()) {
            
            print("on close clicked...")
        }
    }
}
