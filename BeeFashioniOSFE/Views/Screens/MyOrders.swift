//
//  MyOrders.swift
//  BeeFashioniOSFE
//
//  Created by Nguyễn Hưng on 14/05/2025.
//

import SwiftUI

struct MyOrders: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 24))
                
                Spacer()
                
                Text("My Orders")
                    .font(.title)
                    .fontWeight(.black)
                
                Spacer()
                
                Image(systemName: "bell")
                    .font(.system(size: 24))
            }
            .padding(.horizontal, 16)

        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MyOrders()
}
