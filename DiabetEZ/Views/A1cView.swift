//
//  A1cView.swift
//  DiabetEZ
//
//  Created by Adam Nowland on 5/5/21.
//

//
//  A1cView.swift
//  DiabetEZ
//
//  Created by Adam Nowland on 5/5/21.
//

import SwiftUI

struct A1cView: View {
    
    @ObservedObject var measurements = measurementRepository()
    
    
    var total: Int {
        let numbers = measurements.measurements
        var total = 0
//        let count = numbers.count
        for measurement in numbers {
            total += Int(measurement.glucoseNumber)
        }
        return total
    }
    
    var a1c: String {
        let numbers = measurements.measurements
        let count = numbers.count
        if count > 0{
            let averageGlucose = Double(total/count)
            let calculatedA1c =  (46.7 + averageGlucose) / 28.7
            return(String(format: "%.2f", calculatedA1c))
        }
        return "No information yet"
    }
    
    var estimatedAG: String {
        let numbers = measurements.measurements
        let count = numbers.count
        if count > 0 {
            let averageGlucose = Double(total / count)
            return (String(format: "%.2f", averageGlucose))
        }
        return "No information yet"
    }

    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                Text("Average Glucose:")
                    .font(.title3)
                Text("\(estimatedAG)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 300, height: 200)
    
                    .overlay(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color.black, lineWidth: 2)
                        )
                Text("This is a rolling average of all readings")
                    .font(.footnote)
                    .foregroundColor(.black)
                Spacer()
                Text("Hemoglobin A1C:")
                    .font(.title3)
                Text("\(a1c)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 300, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color.black, lineWidth: 2)
                        )
                Text("Hemoglobin A1c is best measured after 3 months of readings")
                    .font(.footnote)
                    .foregroundColor(.black)
                Spacer()
                Text("Please remember these are gross estimations, only having lab work done will give completley accurate readings")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundColor(.gray.opacity(0.7))
                
            }
        }
    }
}

struct A1cView_Previews: PreviewProvider {
    static var previews: some View {
        A1cView()
    }
}
