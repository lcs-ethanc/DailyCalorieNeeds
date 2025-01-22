//
//  ResultView.swift
//  DailyCalorieNeeds
//
//  Created by Pak Ching Ethan Chen on 2025-01-20.
//

import SwiftUI

struct ResultView: View {
    let shownResult: Result
    var body: some View {
        VStack{
            HStack{
                Text("Weight: " + shownResult.weight)
                Text("Height: " + shownResult.height)
                Text("Age: " + shownResult.age)

            }.padding(5)
                Text("Physical Activity Coefficient: \(shownResult.PAC.formatted())")
                .padding(.bottom,5)
                Text(shownResult.dailyCalories)
        }
    }
}

#Preview {
    ResultView(shownResult: resultForPreviews)
}
