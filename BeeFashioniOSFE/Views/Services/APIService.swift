//
//  APIService.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 28/03/2025.
//

import Foundation

enum APIERROR: Error {
    case invalidURL
    case requestFailed(String)
    case decodingFailed
}

class APIService {
    static let shared = APIService()
    private let baseURL = "http://127.0.0.1:8080"
    
    private init() {}
    
    // GET products
    func fetchProducts() async throws -> [ProductResponse] {
        guard let url = URL(string: "\(baseURL)/products") else {
            throw APIERROR.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIERROR.requestFailed("Invalid Response")
        }
        
//        if let jsonString = String(data: data, encoding: .utf8) {
//            print("API Response: \(jsonString)")
//        }
        
        return try JSONDecoder().decode([ProductResponse].self, from: data)
    }
    
    // GET ProductDetail By ID
    func fetchProductDetailByID(productId: String) async throws -> [ProductDetailResponse] {
        guard let url = URL(string: "\(baseURL)/productdetails/getByProductID/\(productId)") else {
            throw APIERROR.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIERROR.requestFailed("Invalid Response")
        }
        
        return try JSONDecoder().decode([ProductDetailResponse].self, from: data)
    }
}
