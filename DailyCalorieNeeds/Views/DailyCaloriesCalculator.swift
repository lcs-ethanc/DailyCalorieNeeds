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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            TextField("Input Weight (kg) [eg. 82.1]", text: $weight)
            TextField("Input Height (m) [eg. 1.78]", text: $weight)
            TextField("Input Age (yrs) [eg. 20]" , text: $weight)
            Slider(value: $PAL, in: 0...5,step:1)
        }
        .padding()
    }
}

#Preview {
    DailyCaloriesCalculator()
}
