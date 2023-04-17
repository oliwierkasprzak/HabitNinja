//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Oliwier Kasprzak on 04/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    
    @State private var addActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.habits.reversed()) { habit in
                    NavigationLink {
                        Activity(habits: habits, habit: habit)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                    .font(.title2.bold())
                                
                                Text(habit.type)
                            }
                            Spacer()
                            
                            Text(String(habit.amount))
                                .padding(5)
                                .frame(minWidth: 40)
                                .background(color(for: habit))
                                .clipShape(Capsule())
                               
                        }
                    }
                }
            }
            .toolbar {
                Button("Add") {
                    addActivity = true
                }
            }
            .sheet(isPresented: $addActivity) {
                AddHabit(habits: habits)
                
            }
        }
    }
    
    func color(for habit: HabitActivity) -> Color {
        if habit.amount < 3 {
            return .red
        } else if habit.amount < 10 {
            return .purple
        } else if habit.amount < 20 {
            return .blue
        } else if habit.amount < 50 {
            return .indigo
        } else {
            return .green
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
