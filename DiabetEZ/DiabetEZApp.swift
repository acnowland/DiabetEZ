//
//  DiabetEZApp.swift
//  DiabetEZ
//
//  Created by Adam Nowland on 5/3/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct DiabetEZApp: App {
    
    init(){
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
