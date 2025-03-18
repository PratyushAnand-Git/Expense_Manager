//
//  GraphView.swift
//  Expense Manager
//
//  Created by Teacher on 18/03/25.
//
import SwiftUI
import Charts
import SwiftData


struct GraphView: View {
    @Query var expenses: [Expense]

    var body: some View {
        VStack {
            Text("Expense History")
                .font(.title)
                .padding()

            if expenses.isEmpty {
                Text("No expense history available.")
                    .font(.body)
                    .foregroundColor(.gray)
            } else {
                Chart(expenses) { expense in
                    LineMark(
                        x: .value("Date", expense.date),
                        y: .value("Amount", expense.amount)
                    )
                    .foregroundStyle(Color.orange)
                }
                .frame(height: 300)
                .padding()
            }
        }
        .navigationTitle("Expense History")
    }
}

