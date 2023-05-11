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
        
        setupAppearanceConfig()
    }
    var body: some Scene {
        WindowGroup {
            
            let vm = AppFactory().makeTransactionListFactory().makeViewModel()
            NavigationView {
                
                TransactionListView(viewModel: vm)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
extension WorldOfPAYBACKApp {
    
    private func setupAppearanceConfig() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "TextSecondary")!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "TextSecondary")!]
        UIRefreshControl.appearance().tintColor = UIColor(named: "ObjectSecondary")
    }
}
