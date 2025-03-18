//
//  ExpenseManagerTabView.swift
//  Expense Manager
//
//  Created by Teacher on 18/03/25.
//

import SwiftUI
import SwiftData

enum TabItem: Hashable {
    case home
    case history
}

struct ExpenseManagerTabView: View {
    @State private var selectedTab: TabItem = .home // Default tab is HomePage

    var body: some View {
        TabView(selection: $selectedTab) {
            // Home Tab
            NavigationView {
                HomePage()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(TabItem.home)

            // Graph Tab
            NavigationView {
                GraphView()
            }
            .tabItem {
                Label("History", systemImage: "chart.bar")
            }
            .tag(TabItem.history)
        }
        .tint(Color.orange)
    }
}


struct ExpenseManagerTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseManagerTabView()
    }
}

