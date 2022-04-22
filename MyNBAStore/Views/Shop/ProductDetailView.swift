//
//  ProductDetailView.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State var selectedSize: ProductSize = .m
    @Binding var isActive: Bool
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 6) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(product.name)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(product.description)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(nil)
            }
            .padding()
            
            Picker("Size", selection: $selectedSize) {
                ForEach(ProductSize.allCases) { tag in
                    Text(tag.rawValue.uppercased())
                        .tag(tag)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button (action: {
                cartManager.addPurchase(purchase: Purchase(quantity: 1, product: product, size: selectedSize))
            }) {
                Text("Acheter en taille \(selectedSize.rawValue.uppercased()) : \(product.price, specifier: "%.2f") €")
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

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: 1, type: .tshirt, name: "LeBron James Lakers Icon Edition 2020", shortDescription: "Maillot Nike NBA Swingman", description: "Le maillot Icon Edition incarne le riche héritage de la franchise, ainsi que son identité emblématique, à travers les couleurs audacieuses de l'équipe.Le maillot Nike NBA Swingman Icon Edition des Lakers de Los Angeles s'inspire de la tenue des joueurs professionnels.Il présente une conception classique en tissu à double maille premium et une coupe qui met en valeur les supporters.Ce produit est entièrement fabriqué à partir de fibres de polyester recyclé.", price: 99.99, imageName: "lebronIconic"), isActive: .constant(true))
            .environmentObject(CartManager())
    }
}
