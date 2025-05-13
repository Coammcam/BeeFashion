//
//  ProductDetailResponse.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 29/03/2025.
//

import Foundation

struct ProductDetailResponse: Decodable {
    var id: String
    var price: Int
    var quantities: [Int]
    var description: String
    var productId: String
    var images: [String]?
    var color: String
    var brandId: String
    var managerId: String
    var sizes: [Size]
}

extension ProductDetailResponse {
    func toProductDetail() -> ProductDetail {
        let uuid = UUID(uuidString: id) ?? UUID()
        
        return ProductDetail(id: uuid, price: self.price, quantities: self.quantities, description: self.description, productId: self.productId, color: self.color, brandId: self.brandId, managerId: self.managerId, sizes: self.sizes)
    }
}
