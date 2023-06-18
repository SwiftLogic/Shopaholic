//
//  Product.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import Foundation

struct Product: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var price: String
    
    static let placeholders = [
        Product(image: "bag1", title: "Office Bag", price: "$234"),
        Product(image: "bag5", title: "Stylus Bag", price: "$434"),
        Product(image: "bag6", title: "Round Belt", price: "$134"),
        Product(image: "bag2", title: "Belt Bag", price: "$294"),
        Product(image: "bag3", title: "Hang Top", price: "$204"),
        Product(image: "bag4", title: "Old Fashion", price: "$334")
    ]
}

enum SwipeMenu: CaseIterable, CustomStringConvertible {
    case handBag
    case jewellery
    case footwear
    case dresses
    case beauty
    
    var description: String {
        switch self {
        case .handBag:
            return "Hand Bag"
        case .jewellery:
            return "Jewellery"
        case .footwear:
            return "Footwear"
        case .dresses:
            return "Dresses"
        case .beauty:
            return "Beauty"
        }
    }
}
