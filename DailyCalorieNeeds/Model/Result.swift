//
//  Result.swift
//  DailyCalorieNeeds
//
//  Created by Pak Ching Ethan Chen on 2025-01-20.
//

import Foundation

struct Result: Identifiable{
    let id = UUID()
    let weight: String
    let height: String
    let age: String
    let PAC: Double
    let dailyCalories: String
}

let resultForPreviews = Result(weight: "100", height: "1.7", age: "17", PAC: 1.3, dailyCalories: "")
