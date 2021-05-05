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
    var userID: String?
}

