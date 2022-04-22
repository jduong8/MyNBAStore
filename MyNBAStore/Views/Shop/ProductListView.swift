//
//  ProductListView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI


struct ProductListView: View {
    
    @ObservedObject var readProductsData = ReadProductsData()

    private static let spacing: CGFloat = 15
    private let columns: [GridItem] = (0...2).map { _ in
        GridItem(.flexible(), spacing: spacing, alignment: .top)
    }

    @Binding var isActive: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: ProductListView.spacing) {
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
