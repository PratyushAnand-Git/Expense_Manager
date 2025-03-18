//
//  AddExpensePage.swift
//  Expense Manager
//
//  Created by Teacher on 18/03/25.
//

import SwiftUI
import SwiftData

struct AddExpensePage: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var amount: String = ""
    @State private var isPressed = false // State to track button press animation

    var body: some View {
        ZStack {
            Image("pexels-gdtography-277628-950241")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()
                .ignoresSafeArea()

            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange.opacity(0.3))
                        .frame(width: 380, height: 40)
                        .shadow(radius: 50)

                    TextField("Expense Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }

                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange.opacity(0.3))
                        .frame(width: 380, height: 40)
                        .shadow(radius: 50)

                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }

                Button(action: {
                    if let amountValue = Double(amount) {
                        let newExpense = Expense(name: name, amount: amountValue)
                        context.insert(newExpense)

                        // Dismiss the current view and return to HomePage
                        dismiss()
                    }
                }) {
                    Text("Add Expense")
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .scaleEffect(isPressed ? 1.1 : 1.0) // Scale effect for animation
                        .animation(.easeInOut(duration: 0.2), value: isPressed)
                }
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            isPressed = true // Button scales up
                        })
                        .onEnded({ _ in
                            isPressed = false // Button returns to original size
                        })
                )
            }
            .navigationTitle("Add Expense")
        }
    }
}

struct AddExpensePage_Previews: PreviewProvider {
    static var previews: some View {
        // Create a model container for preview
        let container: ModelContainer
        do {
            container = try ModelContainer(for: Expense.self)
        } catch {
            fatalError("Failed to create model container: \(error)")
        }

        // Use the container in the preview
        return AddExpensePage()
            .modelContainer(container)
    }
}
