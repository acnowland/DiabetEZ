//
//  MeasurementRepository.swift
//  DiabetEZ
//
//  Created by Adam Nowland on 5/3/21.
//

import Foundation
import Firebase
import FirebaseAuth
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
        let userID = Auth.auth().currentUser?.uid
        
        db.collection(path)
            .order(by: "date")
            .whereField("userID", isEqualTo: userID)
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
            
            var tooAdd = measurement
            tooAdd.userID = Auth.auth().currentUser?.uid
            let _ = try db.collection(path).addDocument(from: tooAdd)
        }
        catch{
            fatalError("Unable to add measurement \(error.localizedDescription)")
        }
        
    }
}
