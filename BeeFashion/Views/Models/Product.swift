//
//  Product.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 27/03/2025.
//

import SwiftUI

struct Product {
    let id = UUID()
    let name: String
    let image: String
    let price: Int
    let quantity: [Int]
    let categoryId: String
    let isFavByCurrentUser: Bool
    
    init(id: UUID = UUID(), name: String, image: String, price: Int, quantity: [Int], categoryId: String, isFavByCurrentUser: Bool) {
        self.name = name
        self.image = image
        self.price = price
        self.quantity = quantity
        self.categoryId = categoryId
        self.isFavByCurrentUser = isFavByCurrentUser
    }
}
