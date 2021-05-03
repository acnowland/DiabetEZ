//
//  MeasurementRepository.swift
//  DiabetEZ
//
//  Created by Adam Nowland on 5/3/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class measurementRepository: ObservableObject {
    
    let path = "Measurements"
    let db = Firestore.firestore()
    
    @Published var measurements = [glucoseMeasurment]()
    
    init(){
        loadData()
    }
    
    func loadData(){
        db.collection(path).addSnapshotListener{ (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            self.measurements =  snapshot?.documents.compactMap{ document in
                try? document.data(as: glucoseMeasurment.self)
            } ?? []
        }
    }
}
