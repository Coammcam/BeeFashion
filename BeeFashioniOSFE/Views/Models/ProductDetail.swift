//
//  ProductDetail.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 29/03/2025.
//

import Foundation

struct ProductDetail {
    var id = UUID()
    var price: Int
    var quantities: [Int]
    var description: String
    var productId: String
    var images: [String]?
    var color: String
    var brandId: String
    var managerId: String
    var sizes: [Size]
    
    init(id: UUID = UUID(), price: Int, quantities: [Int], description: String, productId: String, images: [String]? = nil, color: String, brandId: String, managerId: String, sizes: [Size]) {
        self.id = id
        self.price = price
        self.quantities = quantities
        self.description = description
        self.productId = productId
        self.images = images
        self.color = color
        self.brandId = brandId
        self.managerId = managerId
        self.sizes = sizes
    }
}
