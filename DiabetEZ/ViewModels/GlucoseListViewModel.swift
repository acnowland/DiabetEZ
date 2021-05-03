//
//  GlucoseListViewModel.swift
//  Diabet-EZ
//
//  Created by Adam Nowland on 5/3/21.
//

import Foundation
import Combine


class GlucoseListViewModel: ObservableObject {
    
    @Published var glucoseMeasurmentViewModels = [GlucoseMeasurementViewModel]()
    
    init() {
        self.glucoseMeasurmentViewModels = testData.map{ measurement in
            GlucoseMeasurementViewModel(measurement: measurement)
        }
    }
}
