//
//  HomePage.swift
//  Expense Manager
//
//  Created by Teacher on 18/03/25.
//

import SwiftUI
import SwiftData


struct HomePage: View {
    @Environment(\.modelContext) var context
    @Query var expenses: [Expense]

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses) { expense in
                    HStack {
                        Text(expense.name)
                        Spacer()
                        Text("₹\(expense.amount, specifier: "%.2f")")
                    }
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddExpensePage()) {
                        Text("Add")
                    }
                }
            }
            .background(
                Image("pexels-gdtography-277628-950241")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea() // Ensures the image covers the entire screen
            )
        }
    }
}
 

//struct HomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        let container: ModelContainer
//        do {
//            container = try ModelContainer(for: Expense.self)
//        } catch {
//            fatalError("Failed to create model container: \(error.localizedDescription)")
//        }
//
//        let context = ModelContext(container)
//        context.insert(Expense(name: "Sample Expense 1", amount: 100))
//        context.insert(Expense(name: "Sample Expense 2", amount: 250))
//
//        return HomePage()
//            .modelContainer(container)
//    }
//}
struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .modelContainer(for: Expense.self, inMemory: true)
    }
}
