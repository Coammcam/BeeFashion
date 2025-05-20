//
//  MyOrders.swift
//  BeeFashioniOSFE
//
//  Created by Nguyễn Hưng on 14/05/2025.
//

import SwiftUI

struct MyOrders: View {
    @State private var selectedTab = 0
    
    let sampleItems: [OrderItem] = [
        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 120000, status: OrderStatus.intransit),
        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 120000, status: OrderStatus.pending),
        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 120000, status: OrderStatus.packing),
        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 120000, status: OrderStatus.pending),
        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 120000, status: OrderStatus.packing),
        
        // please do not delete
        
        //        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 240000, status: OrderStatus.completed),
        //        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 240000, status: OrderStatus.completed),
        //        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 240000, status: OrderStatus.completed),
        //        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 240000, status: OrderStatus.completed),
        //        OrderItem(imageName: "photo", name: "Regular Fit Slogan", size: "M", price: 240000, status: OrderStatus.completed),
    ]
    
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
            
            HStack {
                TabButton(name: "OnGoing", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                TabButton(name: "Completed", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 16)
            
            // tab content
            Group {
                let filteredItems = sampleItems.filter {
                    selectedTab == 0
                    ? [.intransit, .packing, .pending].contains($0.status)
                    : $0.status == .completed
                }
                
                if filteredItems.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "shippingbox")
                            .font(.system(size: 64))
                            .foregroundColor(.black)
                        
                        Text(selectedTab == 0 ? "No Ongoing Orders!" : "No Completed Orders!")
                            .font(.title)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        
                        VStack {
                            Text(selectedTab == 0 ? "You don’t have any ongoing orders": "You don’t have any completed orders")
                            Text("at this time.")
                        }
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(filteredItems) { item in
                        OrderItemView(item: item)
                            .listRowInsets(EdgeInsets())
                            .padding(.bottom, 16)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                    .scrollIndicators(.hidden)
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabButton: View {
    let name: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(name)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(isSelected ? .black : .gray)
                .background(isSelected ? Color.white : Color.clear)
                .cornerRadius(5)
        }
    }
}

struct OrderItem: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let size: String
    let price: Double
    let status: OrderStatus
}

enum OrderStatus: String {
    case pending = "Pending"
    case packing = "Packing"
    case intransit = "Intransit"
    case completed = "Completed"
}

struct OrderItemView: View {
    var item: OrderItem
    
    var body: some View {
        HStack(spacing: 15) {
            Image(item.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.name)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text(item.status.rawValue)
                            .font(.system(size: 16))
                            .padding(.horizontal, 10)
                            .background(item.status == .completed ? .green.opacity(0.3) : .gray.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .padding(.leading, 10)
                            .foregroundStyle(item.status == .completed ? .green : .black)
                    }
                    
                    Text("Size \(item.size)")
                        .foregroundStyle(.gray)
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    Text("\(formatPrice(item.price)) VND")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Spacer()
                    
                    Button("Track Order") {
                        
                    }
                    .buttonStyle(.plain)
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .padding()
        .overlay (
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.3), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

func formatPrice(_ price: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = "."
    formatter.locale = Locale(identifier: "vi_VN")
    return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
}

#Preview {
    MyOrders()
}

#Preview {
    OrderItemView(item: OrderItem(imageName: "photo", name: "Regular Fit Slogannn", size: "M", price: 120000, status: OrderStatus.intransit))
}
