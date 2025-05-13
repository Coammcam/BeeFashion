//
//  ProductDetail.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 29/03/2025.
//

import SwiftUI

struct ProductDetailScreen: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Spacer()
                
                Text("Details")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            AsyncImage(url: URL(string: "")) { phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 360)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    case .failure:
                        Image(systemName: "photo")
                            .scaledToFit()
                            .frame(height: 360)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    default:
                        ProgressView()
                }
                
            }
            
            
        }
        .padding(8)
    }
}

#Preview {
    ProductDetailScreen()
}
