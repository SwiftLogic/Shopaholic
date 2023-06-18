//
//  BagModel.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import Foundation

struct BagModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var price: String
    
    static let bags = [
        BagModel(image: "bag1", title: "Office Bag", price: "$234"),
        BagModel(image: "bag5", title: "Stylus Bag", price: "$434"),
        BagModel(image: "bag6", title: "Round Belt", price: "$134"),
        BagModel(image: "bag2", title: "Belt Bag", price: "$294"),
        BagModel(image: "bag3", title: "Hang Top", price: "$204"),
        BagModel(image: "bag4", title: "Old Fashion", price: "$334")
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
