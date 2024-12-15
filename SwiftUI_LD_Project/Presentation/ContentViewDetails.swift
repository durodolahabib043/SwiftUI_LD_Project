//
//  ContentViewDetails.swift
//  SwiftUI_LD_Project
//
//  Created by Habib Durodola on 12/14/24.
//

import SwiftUI

struct ContentViewDetails: View {
    let entry : Entry?
    @State private var counter : Int = 0
    var body: some View {
        VStack {
            Text(getEntry().name)
            Text(getEntry().type)
            Text(getEntry().price)
            AsyncImage(url: URL(string: getEntry().image)) { image in
                image.resizable()
                    .frame(height: 150)
            } placeholder: {
                ProgressView()
            }
            Button("Add to Cart") {
                counter += 1
            }
            .frame(maxWidth: .infinity, minHeight: 40)
            .foregroundColor(.white)
            .background(.black)
            .overlay(RoundedRectangle(cornerRadius: 25)
                             .stroke(Color.white, lineWidth: 1))
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .cornerRadius(25)
            
            
            Spacer()
            if counter != 0 {
                Text("\(counter) Item(s) add to cart")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(.orange)
                    .foregroundColor(.white)
            }

        }
        .padding()
    }
    
    private func getEntry() -> Entry {
        guard let entry = entry else {
            return .init(
                code: "123",
                image: "https://assets.beauty.shoppersdrugmart.ca/bb-prod-product-image/17000145648/enfr/01/front/400/white.jpg",
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
                         image: "https://assets.beauty.shoppersdrugmart.ca/bb-prod-product-image/17000145648/enfr/01/front/400/white.jpg",
                         name: "Shample",
                         price: "$23",
                         type: "Beauty"))
    }
}
