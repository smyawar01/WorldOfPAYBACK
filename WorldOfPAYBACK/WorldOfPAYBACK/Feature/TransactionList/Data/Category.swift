//
//  Category.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 5/15/23.
//

import Foundation

struct Category: Identifiable {
    let type: Int
    let id: UUID
}

extension Category: Comparable, Hashable {
    
    static func < (lhs: Category, rhs: Category) -> Bool { lhs.type < rhs.type }
}
