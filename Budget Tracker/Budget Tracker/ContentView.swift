//
//  ContentView.swift
//  Budget Tracker
//
//  Created by Javier R on 8/31/23.
//

import SwiftUI

struct ExpenseEntry {
    var description: String
    var amount: Double
}
/*
struct ContentView: View {
    @State private var description = ""
    @State private var amount = ""
    @State private var expenses: [ExpenseEntry] = []

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Add Expense")) {
                        TextField("Description", text: $description)
                        TextField("Amount", text: $amount)
                        Button("Add Expense") {
                            if let amountValue = Double(amount) {
                                expenses.append(ExpenseEntry(description: description, amount: amountValue))
                                description = ""
                                amount = ""
                            }
                        }
                    }

                    Section(header: Text("Expenses")) {
                        ForEach(expenses, id: \.description) { expense in
                            HStack {
                                Text(expense.description)
                                Spacer()
                                Text("$\(expense.amount, specifier: "%.2f")")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .navigationTitle("Budget Tracker")

                Text("Total Expenses: $\(totalExpenses, specifier: "%.2f")")
                    .font(.headline)
                    .padding()
            }
            .padding()
        }
    }

    var totalExpenses: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
}


struct BudgetTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
 */
struct ContentView: View {
    @State private var description = ""
    @State private var amount = ""
    @State private var expenses: [ExpenseEntry] = []

    var body: some View {
        NavigationView {
            Form {
               /* Section(header: Text("Add Expense")) {
                    TextField("Description", text: $description)
                        .padding()
                    TextField("Amount", text: $amount)
                        .padding()
                    Button("Add Expense") {
                        if let amountValue = Double(amount) {
                            expenses.append(ExpenseEntry(description: description, amount: amountValue))
                            description = ""
                            amount = ""
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                } */
                // ... Inside the Form section ...
                Section(header: Text("Add Expense")) {
                    TextField("Description", text: $description)
                        .padding()

                    TextField("Amount", text: $amount)
                        .padding()
                        .keyboardType(.decimalPad) // Use decimal keyboard for numeric input

                    if let numericAmount = Double(amount) {
                        Button("Add Expense") {
                            expenses.append(ExpenseEntry(description: description, amount: numericAmount))
                            description = ""
                            amount = ""
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    } else {
                        Text("Please enter a valid numeric amount")
                            .foregroundColor(.red)
                    }
                }
                // ...


                Section(header: Text("Expenses")) {
                    ForEach(expenses, id: \.description) { expense in
                        HStack {
                            Text(expense.description)
                            Spacer()
                            Text("$\(expense.amount, specifier: "%.2f")")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Budget Tracker")
            .accentColor(.blue)

            Text("Total Expenses: $\(totalExpenses, specifier: "%.2f")")
                .font(.headline)
                .padding()
        }
        .padding()
        .background(Color(UIColor.systemGray6))
    }

    var totalExpenses: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



