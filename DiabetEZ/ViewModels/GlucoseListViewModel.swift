//
//  GlucoseListViewModel.swift
//  Diabet-EZ
//
//  Created by Adam Nowland on 5/3/21.
//

import Foundation
import Combine


class GlucoseListViewModel: ObservableObject {
    
    @Published var measurementRespository = measurementRepository()
    @Published var glucoseMeasurmentViewModels = [GlucoseMeasurementViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        measurementRespository.$measurements
            .map{ measurements in
                measurements.map { measurement in
                    return GlucoseMeasurementViewModel(measurement: measurement)
                }
            }
            .assign(to: \.glucoseMeasurmentViewModels, on: self)
            .store(in: &cancellables)
    }
}
