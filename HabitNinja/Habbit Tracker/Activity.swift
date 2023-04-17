//
//  Activity.swift
//  Habbit Tracker
//
//  Created by Oliwier Kasprzak on 05/02/2023.
//

import SwiftUI

struct Activity: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    var habit: HabitActivity
    @State private var amount = 0
    
    var body: some View {
        NavigationView {
            
            Section {
                
                Form {
                    Text("Completion count")
                    Stepper("\(amount.formatted())", value: $amount, in: 0...1000)
                        .textFieldStyle(.roundedBorder)
                        .listRowSeparator(.hidden)
                }
            }
            .toolbar {
                Button("Save", action: {
                    habits.updateHabit(habit: habit, amount: amount)
                    dismiss()
                })
            }
        }
    }
    
    init(habits: Habits, habit: HabitActivity) {
        self.habits = habits
        self.habit = habit
        _amount = State(initialValue: habit.amount)
    }
}

struct Activity_Previews: PreviewProvider {
    
    static var previews: some View {
        Activity(habits: Habits(), habit: HabitActivity(name: "test", type: "test"))
    }
}
