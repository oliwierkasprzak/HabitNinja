//
//  Habits.swift
//  Habbit Tracker
//
//  Created by Oliwier Kasprzak on 04/02/2023.
//

import Foundation

class Habits: ObservableObject {
    @Published var habits = [HabitActivity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
        
    }
    
    init() {
        if let savedItem = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([HabitActivity].self, from: savedItem) {
                habits = decodedItems
                return
            }
        }
        
        habits = []
    }
    
    func updateHabit(habit: HabitActivity, amount: Int) {
            if let index = habits.firstIndex(of: habit) {
                habits[index].amount = amount
            }
        }
    
    
}
