//
//  ExpenseManagerApp.swift
//  Expense Manager
//
//  Created by Teacher on 18/03/25.
//

import SwiftUI
import SwiftData

@main
struct ExpenseManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ExpenseManagerTabView()
                .modelContainer(for: Expense.self) // Configure SwiftData
        }
    }
}
