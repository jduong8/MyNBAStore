//
//  QuantitySelectorView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

struct QuantitySelectorView: View {
    
    @Binding var quantity: Int
    
    func indexMinus() {
        quantity = max(quantity - 1, 1)
    }
    func indexPlus() {
        quantity = min(quantity + 1, .max)
    }
    var isMinusEnable: Bool {
        quantity > 1
    }
    var isPlusEnable: Bool {
        quantity < 10
    }
    
    var body: some View {
        
        HStack {
            Button (action: indexMinus, label: {
                Image(systemName: "minus.circle")
            }).disabled(!isMinusEnable)
            
            Text("\(quantity)")
            
            Button(action: indexPlus, label: {
                Image(systemName: "plus.circle")
            }).disabled(!isPlusEnable)
        }
    }
}

//struct QuantitySelectorView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuantitySelectorView()
//    }
//}
