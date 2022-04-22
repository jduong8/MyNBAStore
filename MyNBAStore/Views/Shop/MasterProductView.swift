//
//  MasterProductView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

struct MasterProductView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        if isActive {
            ProductDetailView(product: Product.exemple, isActive: .constant(true))
        } else {
            ProductListView(isActive: .constant(false))
        }
    }
}

struct MasterProductView_Previews: PreviewProvider {
    static var previews: some View {
        MasterProductView()
    }
}
