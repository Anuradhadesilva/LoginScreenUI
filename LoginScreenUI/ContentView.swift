//
//  ContentView.swift
//  LoginScreenUI
//
//  Created by Anuradha Desilva on 16/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongusername = 0
    @State private var wrongpassword = 0
    @State private var showingLoginScreen = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
                    Text("Login:")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Enter username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10.0)
                        .border(.red, width: CGFloat(wrongusername))
                    SecureField("Enter password", text:$password)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10.0)
                        .border(.red, width: CGFloat(wrongpassword))
                    Button("Login"){
                       authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300,height: 50)
                    .background(Color.blue)
                    .cornerRadius(10.0)
                    .navigationDestination(isPresented: $showingLoginScreen) {
                        
                        Text("Yo have logged @\(username)")
                        
                    }
                }
            }
            .navigationBarHidden(true)
        }
        
    }
        func authenticateUser(username: String, password: String){
            if username.lowercased() == "mario123"{
                wrongusername = 0
                if password.lowercased() == "abc123"{
                    wrongpassword = 0
                    showingLoginScreen = true
                }
                else{
                    wrongpassword = 2
                }
            }else{
                wrongusername = 2
            }
        }
}

//struct logged : View {
//    var body: some View {
//        
//    }
//}

#Preview {
    ContentView()
}
