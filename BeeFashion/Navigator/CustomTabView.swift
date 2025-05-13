//
//  CustomTabView.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 24/03/2025.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedIndex: Int = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            Group {
                switch selectedIndex {
                case 1:
                    Home()
                case 2:
                    Search()
                case 3:
                    Saved()
                case 4:
                    Cart()
                case 5:
                    Account()
                default:
                    Home()
                }
            }
            .padding(.bottom, 50)
            
            Spacer()
            
            HStack {
                Spacer()
                
                // Home Tab
                Button(action: {selectedIndex = 1}) {
                    VStack {
                        Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(selectedIndex == 1 ? Color.black : Color.gray)
                        Text("Home")
                            .font(.system(size: 12))
                            .foregroundStyle(selectedIndex == 1 ? Color.black : Color.gray)
                    }
                }
                
                Spacer()
                
                // Search Tab
                Button(action: {selectedIndex = 2}) {
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(selectedIndex == 2 ? Color.black : Color.gray)
                        Text("Search")
                            .font(.system(size: 12))
                            .foregroundStyle(selectedIndex == 2 ? Color.black : Color.gray)
                    }
                }
                
                Spacer()
                
                // Saved Tab
                Button(action: {selectedIndex = 3}) {
                    VStack {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(selectedIndex == 3 ? Color.black : Color.gray)
                        Text("Saved")
                            .font(.system(size: 12))
                            .foregroundStyle(selectedIndex == 3 ? Color.black : Color.gray)
                    }
                }
                
                Spacer()
                
                // Cart Tab
                Button(action: {selectedIndex = 4}) {
                    VStack {
                        Image(systemName: "cart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(selectedIndex == 4 ? Color.black : Color.gray)
                        Text("Cart")
                            .font(.system(size: 12))
                            .foregroundStyle(selectedIndex == 4 ? Color.black : Color.gray)
                    }
                }
                
                Spacer()
                
                // Account Tab
                Button(action: {selectedIndex = 5}) {
                    VStack {
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(selectedIndex == 5 ? Color.black : Color.gray)
                        Text("Account")
                            .font(.system(size: 12))
                            .foregroundStyle(selectedIndex == 5 ? Color.black : Color.gray)
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    CustomTabView()
}
