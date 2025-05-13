//
//  CustomEditText.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 13/02/2025.
//

import SwiftUI

struct CustomEditText: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var isPassword: Bool = false
    @State private var isSecure: Bool = true
    
    var body: some View {
        Text("\(title)")
            .font(.system(size: 16))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        ZStack {
            if isPassword && isSecure {
                SecureField(placeholder, text: $text)
                    .padding(.trailing, 40)
                    .padding(.leading, 10)
                    .frame(height: 52)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            } else {
                TextField(placeholder, text: $text)
                    .padding(.trailing, 40)
                    .padding(.leading, 10)
                    .frame(height: 52)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            
            if isPassword {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    CustomEditText(title: "Password", placeholder: "Enter your password", text: $text, isPassword: true)
}
