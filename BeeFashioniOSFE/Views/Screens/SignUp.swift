//
//  SignUp.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 13/02/2025.
//

import SwiftUI

struct SignUp: View {
    @State var fullname: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Text("Create an account")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                
                Text("Let's create your account")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 40)
            
            CustomEditText(title: "Full Name", placeholder: "Enter your full name", text: $fullname)
            
            Spacer().frame(height: 20)
            
            CustomEditText(title: "Email", placeholder: "Enter your email address", text: $email)
            
            Spacer().frame(height: 20)
            
            CustomEditText(title: "Password", placeholder: "Enter your password", text: $password, isPassword: true)
            
            Spacer().frame(height: 20)
            
            Text("By signing up you agree to our ")
                    + Text("Terms").underline()
                    + Text(", ")
                    + Text("Privacy Policy").underline()
                    + Text(", and ")
                    + Text("Cookie Use").underline()
            
            Spacer().frame(height: 20)
            
            CustomButton(text: "Create an Account") {
                print("create an account clicked")
            }
            
            Spacer().frame(height: 20)
            
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                
                Text("Or")
                    .padding(.horizontal, 8)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {
                print("Sign Up with google clicked")
            }) {
                HStack {
                    Image("google")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        
                    
                    Text("Sign Up with Google")
                        .foregroundStyle(Color.black)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            
            Spacer().frame(height: 15)
            
            Button(action: {
                print("Sign Up with facebook clicked")
            }) {
                HStack {
                    Image("facebook")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        
                    
                    Text("Sign Up with Facebook")
                        .foregroundStyle(Color.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1)
                )
            }
            
            Spacer()
            
            Text("Already have an account? ")
                .foregroundStyle(Color.gray)
            + Text("Log In").underline().fontWeight(.bold)
        }
        .padding()
    }
}

#Preview {
    SignUp(fullname: "", email: "", password: "")
}
