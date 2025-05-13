//
//  ProductDetailViewModel.swift
//  BeeFashion
//
//  Created by Nguyễn Hưng on 29/03/2025.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var productdetail: [ProductDetail] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let apiService = APIService.shared
    
    func fetchProductDetail(id: String) async {
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }
        
        do {
            let responses = try await apiService.fetchProductDetailByID(productId: id)
            await MainActor.run {
                productdetail = responses.map { $0.toProductDetail()}
            }
        } catch {
            await MainActor.run {
                isLoading = false
                errorMessage = error.localizedDescription
            }
        }
    }
}
