//
//  ContentView.swift
//  SwiftUI_LD_Project
//
//  Created by Habib Durodola on 12/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var contentViewModel = ContentViewModel()

      private let adaptiveColumn = [
          GridItem(.adaptive(minimum: 150))
      ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                  LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                      ForEach(contentViewModel.entry, id: \.id) { entry in
                        
                          NavigationLink(destination: ContentViewDetails(entry: entry)) {
                                               VStack(alignment: .center) {
                                                   AsyncImage(url: URL(string: entry.image)) { image in
                                                    image.resizable()
                                                           .frame(height: 150)
                                                   } placeholder: {
                                                    ProgressView()
                                                   }
                                                   .frame(maxWidth: .infinity)
                                                   Text(entry.name)
                                                   Text(entry.code)
                                                   Text(entry.price)
                                                   Spacer()
                                               }.foregroundColor(.black)
                                               .border(.gray)
                                               .frame(maxWidth: .infinity)
                                           }
                          
                      }
                  }
                  
              }
              .padding()
              .onAppear {
                  Task {
                      await contentViewModel.fetchClientCart()
                  }
              }
              .navigationTitle("Product")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
