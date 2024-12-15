//
//  ContentViewDetails.swift
//  SwiftUI_LD_Project
//
//  Created by Habib Durodola on 12/14/24.
//

import SwiftUI

struct ContentViewDetails: View {
    let entry : Entry?
    var body: some View {
        VStack {
            Text(getEntry().name)
            Text(getEntry().type)
        }
    }
    
    private func getEntry() -> Entry {
        guard let entry = entry else {
            return .init(
                code: "123",
                image: "",
                name: "Shample",
                price: "$23",
                type: "Beauty"
            )
        }
        
        return entry
    }
}

struct ContentViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewDetails(
            entry: .init(code: "123",
                         image: "",
                         name: "Shample",
                         price: "$23",
                         type: "Beauty"))
    }
}
