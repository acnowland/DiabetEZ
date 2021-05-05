//
//  AddMeasurementView.swift
//  Diabet-EZ
//
//  Created by Adam Nowland on 5/3/21.
//

import SwiftUI

struct AddMeasurementView: View {
    
    @State var date = ""
    @State var reading = ""
    @State var showAddedAlert = false
    @State var todaysDate = Date()
    @ObservedObject var measurements = measurementRepository()

    
    func converToInt(reading: String) -> Int {
        return Int(reading)!
    }
        
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
//                    DatePicker("Select Date", selection: $todaysDate, displayedComponents: .date)
                    TextField("Please enter the date", text: $date)
                    TextField("Please enter glucose reading", text: $reading)
                        .keyboardType(.numberPad)
                }
                Section{
                    Button("Submit Measurement"){
                        self.showAddedAlert.toggle()
                        let numReading = converToInt(reading: reading)
                        let glucoseMeasruement = glucoseMeasurment(date: date, glucoseNumber: numReading)
                        measurements.addData(glucoseMeasruement)
                        self.date = ""
                        self.reading = ""
                    }
                }
                
            }
            .navigationTitle("Add Measurement")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAddedAlert){
                Alert(title: Text("Measurement added, please return to home screen"),
                      dismissButton: .default(Text("Thank You")))
                
            }
        }
    }
}






struct AddMeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        AddMeasurementView()
    }
}
