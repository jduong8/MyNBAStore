//
//  CartManager.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

class CartManager: ObservableObject {
    
    @Published var purchases: [Purchase] = []
    
    func addPurchase(purchase: Purchase) {
        if let index = purchases.firstIndex(where: { $0.product.id == purchase.product.id && $0.size == purchase.size }) {
            let oldPurchase = purchases.first { $0.product.id == purchase.product.id && $0.size == purchase.size }!
            let newPurchase = Purchase(quantity: oldPurchase.quantity + purchase.quantity, product: oldPurchase.product, size: oldPurchase.size)
            purchases.remove(at: index)
            purchases.append(newPurchase)
        } else {
            purchases.append(purchase)
        }
    }
}
