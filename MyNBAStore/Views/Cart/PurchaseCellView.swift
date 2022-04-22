//
//  PurchaseCellView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

struct PurchaseCellView: View {
    
    @State var purchase: Purchase
    
    var body: some View {
        HStack {
            Image(purchase.product.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .padding(.bottom)
            VStack {
                Text(purchase.product.name)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text(purchase.product.shortDescription)
                    .foregroundColor(.black)
                    .font(.system(size: 15))
                Text("Taille : \(purchase.size.rawValue.uppercased())")
                    .foregroundColor(.black)
                    .opacity(0.3)
                QuantitySelectorView(quantity: $purchase.quantity)
                Text("\(purchase.product.price, specifier: "%.2f") €")
                    .foregroundColor(.black)
            }
        }
    }
}

struct PurchaseCellView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseCellView(purchase: Purchase.purchase1)
    }
}
