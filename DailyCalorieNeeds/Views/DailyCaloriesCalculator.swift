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
    @State var feedback = ""
    
    //MARK: Computed Properties
    
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
            
            TextField("Input Height (m) [eg. 1.78]", text: $height)
                .font(.system(size:20))
            
            TextField("Input Age (yrs) [eg. 20]" , text: $age)
                .font(.system(size:20))
            
            //Slider and Label
            VStack{
                Slider(value: $PAL, in: 0...5,step:1)
                
                Text("Physical Activity Level: \(PAL.formatted(.number.precision(.fractionLength(1))))")
            }
            Button{
                checkInputs()
            } label:{
                Text("Calculate")
            }
            .buttonStyle(.borderedProminent)
            Text("\(feedback)")
            Spacer()
        }
        .padding()
        
    }
    //MARK: Functions
    func checkInputs(){
        //Check if weight can be converted to Double
        guard let weightValue = Double(weight)
        else {
            feedback = "Please input numeric value for weight"
            return
        }
        
        //Check if height can be converted to Double
        guard let heightValue = Double(height)
        else {
            feedback = "Please input numeric value for height"
            return
        }
        
        //Check if age can be converted to Double
        guard let ageValue = Double(age)
        else {
            feedback = "Please input integer value for age"
            return
        }
        //Check if values are positive
        if weightValue > 0, heightValue > 0, ageValue > 0{
            //Check if values are in
            if weightValue < 300, heightValue < 3, ageValue < 150 {
                let dailyCalories = 662-(9.53*ageValue) + PAL*((15.91*weightValue) + (539.6*heightValue))
                
                feedback = "\(dailyCalories)"
            }
            else{
                feedback = "Please input realistic values"
            }
        }
        else{
            feedback = "Please input positive values"
        }
    }
}

#Preview {
    DailyCaloriesCalculator()
}


