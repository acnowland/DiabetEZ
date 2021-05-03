//
//  DiabetEZApp.swift
//  DiabetEZ
//
//  Created by Adam Nowland on 5/3/21.
//

import SwiftUI
import Firebase

@main
struct DiabetEZApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
