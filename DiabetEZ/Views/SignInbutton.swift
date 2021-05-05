//
//  SignInbutton.swift
//  DiabetEZ
//
//  Created by Adam Nowland on 5/5/21.
//

import Foundation
import SwiftUI
import AuthenticationServices

// 1
final class SignInWithAppleButton: UIViewRepresentable {
  // 2
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    // 3
    return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
  }
  
  // 4
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
  }
}
