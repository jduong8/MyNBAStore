//
//  ProductModel.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import Foundation

struct Product: Identifiable, Decodable {
    let id: Int
    let type: ProductType
    let name: String
    let shortDescription: String
    let description: String
    let price: Double
    let imageName: String
    
    static let exemple = Product(id: 1, type: .tshirt, name: "LeBron James Lakers Icon Edition 2020", shortDescription: "Maillot Nike NBA Swingman", description: "Le maillot Icon Edition incarne le riche héritage de la franchise, ainsi que son identité emblématique, à travers les couleurs audacieuses de l'équipe. Le maillot Nike NBA Swingman Icon Edition des Lakers de Los Angeles s'inspire de la tenue des joueurs professionnels. Il présente une conception classique en tissu à double maille premium et une coupe qui met en valeur les supporters. Ce produit est entièrement fabriqué à partir de fibres de polyester recyclé.", price: 99.99, imageName: "lebronIconic")
}

enum ProductType: Decodable {
    case tshirt
    case hat
    case pants
    case hoodie
    case short
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        switch try container.decode(String.self) {
        case "tshirt": self = .tshirt
        case "hat": self = .hat
        case "pants": self = .pants
        case "hoodie": self = .hoodie
        case "short": self = .short
        default: fatalError()
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .tshirt: try container.encode("tshirt")
        case .hat: try container.encode("hat")
        case .pants: try container.encode("pants")
        case .hoodie: try container.encode("hoodie")
        case .short: try container.encode("short")
        default: fatalError()
        }
    }
}
