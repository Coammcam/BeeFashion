//
//  ProductResponse.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 28/03/2025.
//

import Foundation

struct ProductResponse: Decodable {
    var id: String
    let name: String
    let image: String
    let price: Int
    let quantities: [Int]
    let categoryId: String
    let isFavByCurrentUser: Bool
}

extension ProductResponse {
    func toProduct() -> Product {
        let uuid = UUID(uuidString: id) ?? UUID()
        
        return Product(id: uuid, name: name, image: image, price: price, quantity: quantities, categoryId: categoryId, isFavByCurrentUser: isFavByCurrentUser)
    }
}
