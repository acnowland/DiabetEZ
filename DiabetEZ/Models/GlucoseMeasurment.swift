//
//  GlucoseMeasurment.swift
//  DiabetEZ
//
//  Created by Adam Nowland on 5/3/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct glucoseMeasurment: Codable, Identifiable {
   @DocumentID var id: String?
    var date: String
    var glucoseNumber: Int
}


#if DEBUG
//let testData = [
//    glucoseMeasurment(date: "4/1", glucoseNumber: 155),
//    glucoseMeasurment(date: "4/2", glucoseNumber: 115),
//    glucoseMeasurment(date: "4/3", glucoseNumber: 135),
//    glucoseMeasurment(date: "4/4", glucoseNumber: 175),
//    glucoseMeasurment(date: "12/5", glucoseNumber: 400),
//    glucoseMeasurment(date: "11/5", glucoseNumber: 157)
//]

#endif
