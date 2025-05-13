//
//  CustomButton.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 17/02/2025.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundStyle(Color.white)
                .font(.title2)
                .frame(maxWidth: .infinity, maxHeight: 34)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                
        }
    }
}

#Preview {
    CustomButton(text: "Login") {
        print("Login")
    }
}
