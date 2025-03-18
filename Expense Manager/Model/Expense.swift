//
//  Expense.swift
//  Expense Manager
//
//  Created by Teacher on 18/03/25.
//

import Foundation
import SwiftData

@Model
class Expense {
    var id: UUID
    var name: String
    var amount: Double
    var date: Date

    init(name: String, amount: Double, date: Date = Date()) {
        self.id = UUID()
        self.name = name
        self.amount = amount
        self.date = date
    }
}
