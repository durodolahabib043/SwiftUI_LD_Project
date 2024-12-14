//
//  ApiClientManager.swift
//  SwiftUI_LD_Project
//
//  Created by Habib Durodola on 12/14/24.
//

import Foundation

protocol ApiClienting {
    func fetchCart(inputJson: String) async -> Result<[Entry], Error>
}

class ApiClient : ApiClienting {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchCart(inputJson: String) async -> Result<[Entry], Error> {
        guard let url = URL(string: Constants.BASE_URL + inputJson) else {
            return .failure(ApiError.genericError)
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            if let cart = try? JSONDecoder().decode(LoblawsProduct.self, from: data) {
                return .success(cart.entries)
            } else {
                throw ApiError.genericError
            }
        } catch {
            return .failure(error)
        }
    }
}

struct Constants {
    static let BASE_URL = "https://gist.githubusercontent.com/"
    static let  CART_JSON = "r2vq/2ac197145db3f6cdf1a353feb744cf8e/raw/b1e722f608b00ddde138a0eef2261c6ffc8b08d7/cart.json"
}


enum ApiError : Error {    
    case genericError
}
