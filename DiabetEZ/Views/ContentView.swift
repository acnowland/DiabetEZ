//
//  ContentView.swift
//  Diabet-EZ
//
//  Created by Adam Nowland on 4/29/21.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    @ObservedObject var glucoseListVM = GlucoseListViewModel()
    @ObservedObject var measurements = measurementRepository()
    @State private var isShowingAddMeasurement = false

    
    
    var allReadings: [Double] {
        let numbers = measurements.measurements
        var numberArray = [Double]()
        for measurement in numbers {
            let newReading = Double(measurement.glucoseNumber)
            numberArray.append(newReading)
        }
        return numberArray
    }
    
    
    var body: some View {
        
        VStack {
            NavigationView{
                ZStack{
                    VStack{
                        LineView(data: allReadings, title: "Glucose Readings")
                        List(glucoseListVM.glucoseMeasurmentViewModels){ glucoseMeasurementVM in
                            HStack{
                                Text(glucoseMeasurementVM.measurement.date)
                                    .font(.title3)
                                Spacer()
                                Text("\(glucoseMeasurementVM.measurement.glucoseNumber)")
                                    .font(.title)
                                Spacer()
                            }
                            .padding()
                            
                        }
                        NavigationLink(destination: AddMeasurementView(), isActive: $isShowingAddMeasurement) { EmptyView() }
                        Button(action: {
                            self.isShowingAddMeasurement = true
                            print("Add Glucose Clicked")
                        }) {
                            HStack{
                                Text("Add Glucose Measurement")
                                    .padding(10)
                                    .background(Color.purple)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(35)
                                    .font(.title2)
                                    .padding(.top, 25)
 
                            }
                        }
                        .navigationBarTitle("Diabet-EZ", displayMode: .inline)
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
