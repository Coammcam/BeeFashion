//
//  Account.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 24/03/2025.
//

import SwiftUI

struct Account: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 24))
                    
                    Spacer()
                    
                    Text("Account")
                        .font(.title)
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Image(systemName: "bell")
                        .font(.system(size: 24))
                }
                .padding(.horizontal, 16)
                
                ScrollView {
                    Divider()
                        .frame(height: 1)
                        .padding(.horizontal, 32)
                    
                    NavigationLink(destination: MyOrders()) {
                        CustomTabAccount(icon: "shippingbox", nametab: "My Orders")
                    }
                    
                    Divider()
                        .frame(height: 8)
                        .background(.gray.opacity(0.4))
                    
                    CustomTabAccount(icon: "person.crop.square.filled.and.at.rectangle", nametab: "My Details")
                    
                    Divider()
                        .frame(height: 1)
                        .padding(.leading, 56)
                        .padding(.trailing, 32)
                    
                    CustomTabAccount(icon: "location.north.line", nametab: "Address Book")
                    
                    Divider()
                        .frame(height: 1)
                        .padding(.leading, 56)
                        .padding(.trailing, 32)
                    
                    CustomTabAccount(icon: "creditcard", nametab: "Payment Methods")
                    
                    Divider()
                        .frame(height: 1)
                        .padding(.leading, 56)
                        .padding(.trailing, 32)
                    
                    CustomTabAccount(icon: "bell", nametab: "Notifications")
                    
                    Divider()
                        .frame(height: 8)
                        .background(.gray.opacity(0.4))
                    
                    CustomTabAccount(icon: "questionmark.circle", nametab: "FAQs")
                    
                    Divider()
                        .frame(height: 1)
                        .padding(.leading, 56)
                        .padding(.trailing, 32)
                    
                    CustomTabAccount(icon: "beats.headphones", nametab: "Help Center")
                    
                    Divider()
                        .frame(height: 8)
                        .background(.gray.opacity(0.4))
                    
                    HStack {
                        Image(systemName: "escape")
                            .font(.system(size: 24))
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.red)
                        
                        
                        Text("Logout")
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                            .foregroundStyle(.red)
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 20)
                    
                }
            }
        }
    }
}

#Preview {
    Account()
}
