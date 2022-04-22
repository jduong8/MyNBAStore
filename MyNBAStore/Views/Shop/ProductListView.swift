//
//  ProductListView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

struct ProductListView: View {
    
    @ObservedObject var readProductsData = ReadProductsData()
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(),spacing: 15), count: 2)
    @Binding var isActive: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(readProductsData.products) { myProduct in
                        NavigationLink (
                            destination: ProductDetailView(product: myProduct, isActive: .constant(false)),
                            label: {
                                ProductCellView(product: myProduct)
                            })
                    }
                }
                .padding()
            }
            .navigationTitle("NBA STORE")
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(isActive: .constant(false))
    }
}
