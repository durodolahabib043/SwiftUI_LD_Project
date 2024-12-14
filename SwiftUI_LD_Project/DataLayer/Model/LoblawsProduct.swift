//
//  LoblawsProduct.swift
//  SwiftUI_LD_Project
//
//  Created by Habib Durodola on 12/14/24.
//

import Foundation

struct LoblawsProduct: Codable {
    let entries: [Entry]
}

// MARK: - Entry
struct Entry: Codable, Identifiable {
    let id = UUID()
    let code: String
    let image: String
    let name, price, type: String
}

