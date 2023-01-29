//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = TransactionListViewModelImpl()
            TransactionListView(viewModel: vm)
        }
    }
}
