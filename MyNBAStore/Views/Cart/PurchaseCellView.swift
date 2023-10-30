//
//  PurchaseCellView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

struct PurchaseCellView: View {
    
    @State var purchase: Purchase
    var totalPrice: String {
        self.getPrice(value: purchase.product.price * Double(purchase.quantity))
    }
    
    var body: some View {
        HStack {
            Image(purchase.product.imageName)
                .resizable()
                .frame(width: 100, height: 115)
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
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
                Text("\(totalPrice)")
                    .foregroundColor(.black)
            }
        }
    }
    func getPrice(value: Double) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.locale = .init(identifier: "eu_FR_POSIX")
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}

struct PurchaseCellView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseCellView(purchase: Purchase.purchase1)
    }
}
