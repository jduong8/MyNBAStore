//
//  ProductSizeModel.swift
//  MyNBAStore
//
//  Created by Jonathan Duong on 21/04/2022.
//

import Foundation

enum ProductSize: String, CaseIterable, Identifiable {
    case xs
    case s
    case m
    case l
    case xl
    case xxl
    
    var id: String { self.rawValue }
}
