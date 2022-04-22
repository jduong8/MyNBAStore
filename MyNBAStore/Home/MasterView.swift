//
//  MasterView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

struct MasterView: View {
    var body: some View {
        TabView {
            MasterProductView()
                .tabItem {
                    Text("Magasin")
                    Image(systemName: "house.fill")
                }
            PurchaseView(purchase: Purchase.purchase1)
                .tabItem {
                    Text("Panier")
                    Image(systemName: "cart.fill")
                }
        }.environmentObject(CartManager())
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView().environmentObject(CartManager())
    }
}
