//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 1/29/23.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "TextSecondary")!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "TextSecondary")!]
    }
    var body: some Scene {
        WindowGroup {
            
            let vm = AppFactory().makeTransactionListFactory().makeViewModel()
            NavigationView {
                
                TransactionListView(viewModel: vm)
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
