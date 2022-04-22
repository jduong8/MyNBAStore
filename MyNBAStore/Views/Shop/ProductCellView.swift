//
//  ProductCellView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

struct ProductCellView: View {
    
    var product: Product
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack (alignment: .leading, spacing: 4) {
                Text(product.name)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                Text(product.shortDescription)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                Text("6 Tailles")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                Spacer()
                Text("\(product.price, specifier: "%.2f") €")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
            }
            .multilineTextAlignment(.center)
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 15, alignment: .top),
            GridItem(.flexible(), spacing: 15, alignment: .top)
        ], spacing: 15) {
            ProductCellView(product: Product(id: 1, type: .tshirt, name: "LeBron James Lakers Icon Edition 2020 Edition 2020", shortDescription: "Maillot Nike NBA Swingman Nike NBA Swingman", description: "", price: 99.99, imageName: "lebronIconic"))
            ProductCellView(product: Product(id: 1, type: .tshirt, name: "LeBron James Lakers Icon Edition 2020", shortDescription: "Maillot Nike NBA Swingman", description: "", price: 99.99, imageName: "lebronIconic"))
        }
    }
}
