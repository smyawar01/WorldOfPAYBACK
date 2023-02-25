//
//  Array+UniqueElement.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/25/23.
//

import Foundation

extension Array where Element: Hashable {
    
    func distinct() -> [Element] {
        
        var set = Set<Element>()
        return filter({ set.insert($0).inserted })
    }
}
