//
//  AddHabit.swift
//  Habbit Tracker
//
//  Created by Oliwier Kasprzak on 05/02/2023.
//

import SwiftUI

struct AddHabit: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits
    @State private var name = ""
    @State private var type = "Physical"
    @State private var amount = 0
    
    let types = ["Physical", "Health", "Chores", "Self-Development", "Self-Care", "School", "College", "Fun"]
    
   var body: some View {
        NavigationView {
            Form {
                
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
            }
            .toolbar {
                Button("Save", action: save)
            }
        }
    }
    func save() {
        let habit = HabitActivity(name: name, type: type, amount: amount)
        habits.habits.append(habit)
        dismiss()
    }
    
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
