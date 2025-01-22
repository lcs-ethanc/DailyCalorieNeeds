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
    @State var PAC: Double = 1.2
    @State var feedback = ""
    @State var priorResults: [Result] = []
    //MARK: Computed Properties
    
    var body: some View {
        VStack {
            //Title
            HStack {
               
                Text("Daily Caloric Needs Calculator")
                    .font(.system(size:40))
                Spacer ()
            }
            
            //Weight
            HStack{
                Text("Weight (kg) :")
                TextField("[eg. 82.1]", text: $weight)
            }.font(.system(size:20))
            
            //Height
            HStack{
                Text("Height (m) :")
                TextField("[eg. 1.78]", text: $height)
            }.font(.system(size:20))
            
            //Age
            HStack{
                Text("Age (yrs)")
                TextField("[eg. 20]" , text: $age)
            }                 .font(.system(size:20))
           
            
            //Slider and Label
            VStack{
                Text("Physical Activity Coefficient: \(PAC.formatted(.number.precision(.fractionLength(2))))")
                    
                Slider(value: $PAC, in: 1...1.48,step:0.01)

                //Activity Level Details
                if PAC < 1.11 {
                    Text("Inactive")
                }
                else if PAC < 1.25{
                    Text("Not Very Active")
                }
                else if PAC < 1.37{
                    Text("Active")
                }
                else if PAC <= 1.48{
                    Text("Very Active")
                }

            } .padding(.top,2)
            
            //Button to calculate
            Button{
                checkInputsThenCalc()
            } label:{
                Text("Calculate")
            }.buttonStyle(.borderedProminent)
            
            //Feedback Text
            Text("\(feedback)")
            
            
            //Button to save history
            Button(action: {
            let latestResult = Result(weight: weight, height: height, age: age, PAC: PAC, dailyCalories: feedback)
                priorResults.append(latestResult)
            }, label: {
                Text("Save Result")
            })
            Spacer()
        }
        .padding()
        
    }
    
    //MARK: Functions
    func checkInputsThenCalc(){
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
            feedback = "Please input numeric value for age"
            return
        }
        
        //Check if values are positive
        if weightValue > 0, heightValue > 0, ageValue > 0{
            
            //Check if values are in plausible range
            if weightValue < 300, heightValue < 3, ageValue < 150 {
                let dailyCalories = 662-(9.53*ageValue) + PAC*((15.91*weightValue) + (539.6*heightValue))
                
                feedback = " \(dailyCalories.formatted(.number.precision(.fractionLength(0)))) kcal/day"
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


