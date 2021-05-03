//
//  GMViewModel.swift
//  Diabet-EZ
//
//  Created by Adam Nowland on 5/3/21.
//

import Foundation
import Combine


class GlucoseMeasurementViewModel: ObservableObject, Identifiable {
    var id = ""
    @Published var measurement: glucoseMeasurment
    
    private var cancellables = Set<AnyCancellable>()
    
    init(measurement: glucoseMeasurment){
        self.measurement = measurement
        
        $measurement.map{ measurement in
            measurement.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}
