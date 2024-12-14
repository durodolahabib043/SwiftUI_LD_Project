//
//  ContentViewModel.swift
//  SwiftUI_LD_Project
//
//  Created by Habib Durodola on 12/14/24.
//

import Foundation

protocol ContentViewModelling {
    func fetchClientCart() async
}


class ContentViewModel: ObservableObject {
    @Published var entry : [Entry] = []
    
    private let apiClient : ApiClienting
    
    init(apiClient: ApiClienting = ApiClient()) {
        self.apiClient = apiClient
    }
    
    func fetchClientCart() async {
        Task {
            do {
                let result =  await apiClient.fetchCart(inputJson: Constants.CART_JSON)
                switch result {
                case .success(let entries):
                    DispatchQueue.main.async {
                        self.entry = entries
                        print("Fetched cart entries: \(entries)")
                    }

                case .failure(let error):
                    print("Error fetching cart: \(error)")
                }
            }
        }
    }
    
}

extension ContentViewModel : ContentViewModelling {
    
}
