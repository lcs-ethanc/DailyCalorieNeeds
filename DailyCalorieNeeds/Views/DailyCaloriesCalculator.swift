//
//  ContentView.swift
//  DailyCalorieNeeds
//
//  Created by Pak Ching Ethan Chen on 2025-01-20.
//

import SwiftUI

struct DailyCaloriesCalculator: View {
    //MARK: Stored Properties
    @State var weight = ""
    @State var height = ""
    @State var age = ""
    @State var PAL: Double = 1.2
    
    var body: some View {
        VStack {
            //Title
            HStack {
               
                Text("Daily Calorie Needs Calculator")
                    .font(.system(size:40))
                Spacer ()
            }

            TextField("Input Weight (kg) [eg. 82.1]", text: $weight)
                .font(.system(size:20))
            
            TextField("Input Height (m) [eg. 1.78]", text: $weight)
                .font(.system(size:20))
            
            TextField("Input Age (yrs) [eg. 20]" , text: $weight)
                .font(.system(size:20))
            
            Slider(value: $PAL, in: 0...5,step:1)
            
            Text("Physical Activity Level: \(PAL.formatted(.number.precision(.fractionLength(1))))")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DailyCaloriesCalculator()
}
