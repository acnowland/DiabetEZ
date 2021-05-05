//
//  SignInView.swift
//  DiabetEZ
//
//  Created by Adam Nowland on 5/5/21.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        VStack{
            SignInWithAppleButton()
                .frame(width: 280, height: 70)
                .cornerRadius(25)
                .shadow(color: .purple, radius: 15)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
            Text("When you Sign In you will have access to your reaadings across multiple devices! ")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
                .multilineTextAlignment(.center)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
