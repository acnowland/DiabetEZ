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
        db.collection(path)
            .order(by: "date")
            .addSnapshotListener{ (snapshot, error) in
            if let error = error {
                print(error)
                return
            }

            self.measurements =  snapshot?.documents.compactMap{ document in
                try? document.data(as: glucoseMeasurment.self)
            } ?? []
        }
    }
    
    func addData(_ measurement: glucoseMeasurment){
        do{
            let _ = try db.collection(path).addDocument(from: measurement)
        }
        catch{
            fatalError("Unable to add measurement \(error.localizedDescription)")
        }
        
    }
}
