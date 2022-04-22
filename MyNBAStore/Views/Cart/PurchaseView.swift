//
//  PurchaseView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

struct PurchaseView: View {
    
    @EnvironmentObject var cartManager: CartManager
    var purchase: Purchase
    
    var total: Double {
        cartManager.purchases.map({ $0.product.price }).reduce(0, +)
    }
    var totalQuantity: Int {
        cartManager.purchases.map({ $0.quantity }).reduce(0, +)
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(cartManager.purchases) {
                        PurchaseCellView(purchase: $0)
                    }.onDelete(perform: self.delete)
                }
            }
            Spacer()
            VStack {
                HStack {
                    Text("Nombre d'articles: \(totalQuantity)")
                        .padding(.leading)
                    Spacer()
                    Text("Total: \(total, specifier: "%.2f") €")
                        .padding(.trailing)
                }
                .padding()
                Button (action: {}){
                    Text("Commander")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.black)
                        .cornerRadius(5)
                }
            }
        }
    }
    private func delete(at offsets: IndexSet) {
        self.cartManager.purchases.remove(atOffsets: offsets)
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView(purchase: Purchase.purchase1)
            .environmentObject(CartManager())
    }
}
