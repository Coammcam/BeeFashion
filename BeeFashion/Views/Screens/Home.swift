//
//  Home.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 24/03/2025.
//

import SwiftUI
import Foundation

struct Home: View {
    @State var text: String = ""
    let items = ["All", "Tshirts", "Jeans", "Jackets", "Shoes"]
    @State private var selectedItem: String? = "All"
    
    @StateObject private var viewModel = ProductViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HStack {
                Text("Discover")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.gray)
                        .frame(width: 24, height: 24)
                        .padding(.leading, 8)
                    
                    TextField(
                        "Search for clothes...",
                        text: $text
                    )
                    
                    Image(systemName: "microphone")
                        .foregroundStyle(Color.gray)
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 8)
                }
                .frame(maxWidth: .infinity, minHeight: 52)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                )
                
                Image(systemName: "slider.vertical.3")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: 52, minHeight: 52)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.black)
                    )
                
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        itemView(for: item)
                    }
                }
                .padding(.vertical, 8)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.products, id: \.id) { product in
                        ProductItemView(product: product)
                    }
                    ForEach(viewModel.products, id: \.id) { product in
                        ProductItemView(product: product)
                    }
                }
                .onAppear {
                    Task {
                        await viewModel.fetchProducts()
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    private func itemView(for item: String) -> some View {
        Text(item)
            .foregroundStyle(selectedItem == item ? .white : .black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(selectedItem == item ? Color.black : Color.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
            .onTapGesture {
                selectedItem = item
            }
    }
}

struct ProductItemView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                        case .success(let image):
                            image.resizable()
                                .scaledToFit()
                                .frame(height: 220)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 220)
                                .foregroundColor(.gray)
                        case .empty:
                            ProgressView()
                        default:
                            ProgressView()
                    }
                }
                
                Image(systemName: "heart")
                    .font(.system(size: 20))
                    .frame(width: 40, height: 40)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(8)
                    .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
            }
            
            Text(product.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
            
            Text("\(product.price) VND")
                .foregroundStyle(Color.gray)
        }
        .padding(8)
        //        .frame(width: 160, height: 220)
        .background(RoundedRectangle(cornerRadius: 8)
            .fill(Color.white))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        //        .overlay(
        //            RoundedRectangle(cornerRadius: 8)
        ////                .stroke(Color.red, lineWidth: 1)
        //        )
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
        
    }
}



#Preview {
    //    Home()
    
    ProductItemView(product: Product(
        id: UUID(),
        name: "Áo Thun Nam",
        image: "http://beefashion.duckdns.org:9000/images/image-26-02-2025-08:21:13-shirt 1.jpg",
        price: 69000,
        quantity: [10, 20, 30],
        categoryId: "2112B4BD-26CB-4D46-9F82-0B3B08B99F8D",
        isFavByCurrentUser: false
    ))
}
