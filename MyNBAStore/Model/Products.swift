//
//  Products.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import Foundation

//struct Products {
//    let products: [Product]
//
//    init() {
//        let url = Bundle.main.url(forResource: "NBAStore", withExtension: "json")!
//        let data = try! Data(contentsOf: url)
//        products = try! JSONDecoder().decode([Product].self, from: data)
//    }
//}

class ReadProductsData: ObservableObject {
    @Published var products = [Product]()
    
    init(){
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "NBAStore", withExtension: "json")
        else {
            print("Json file not found...")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let products = try? JSONDecoder().decode([Product].self, from: data!)
        self.products = products!
    }
}
