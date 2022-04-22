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
            VStack (alignment: .leading){
                Text(product.name)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Text(product.shortDescription)
                    .foregroundColor(.gray)
                Text("6 Tailles")
                    .foregroundColor(.gray)
                Text("\(product.price, specifier: "%.2f") €")
                    .foregroundColor(.black)
            }
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: Product(id: 1, type: .tshirt, name: "LeBron James Lakers Icon Edition 2020", shortDescription: "Maillot Nike NBA Swingman", description: "", price: 99.99, imageName: "lebronIconic"))
    }
}
