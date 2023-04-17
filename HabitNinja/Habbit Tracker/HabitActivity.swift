//
//  HabitActivity.swift
//  Habbit Tracker
//
//  Created by Oliwier Kasprzak on 04/02/2023.
//

import Foundation
struct HabitActivity: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    var amount: Int = 0
}
