//
//  ProductViewModel.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 28/03/2025.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let apiService = APIService.shared
    
    func fetchProducts() async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }
        
        do {
            let responses = try await apiService.fetchProducts()
            await MainActor.run {
                products = responses.map{ $0.toProduct() }
                isLoading = false
            }
        } catch {
            await MainActor.run {
                isLoading = false
                errorMessage = error.localizedDescription
            }
        }
    }
    
    
}
