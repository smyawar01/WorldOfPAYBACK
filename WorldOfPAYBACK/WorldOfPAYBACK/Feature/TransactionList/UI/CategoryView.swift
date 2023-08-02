//
//  CategoryView.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 3/2/23.
//

import SwiftUI

struct CategoryView: View {
    
    private let categories: [Category]
    private let onClose: (() -> Void)
    init(categories: [Category], onClose: @escaping () -> Void) {
        self.categories = categories
        self.onClose = onClose
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: Theme.Spacing.expanded) {
            
            Button {
                onClose()
            } label: {
                Image(systemName: "xmark")
            }
            ListView(items: categories) { Text("\($0.type)") }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        let categories: [Category] = [Category(type: 1, id: UUID())]
        CategoryView(categories: categories) {
            
            print("on close clicked...")
        }
    }
}
