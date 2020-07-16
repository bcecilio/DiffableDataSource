//
//  Item.swift
//  ShoppingList
//
//  Created by Brendon Cecilio on 7/15/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import Foundation

struct Item: Hashable {
    let name: String
    let price: Double
    let category: Category
    let identifier = UUID()
    
    // this will make the an item's unique property its identifier
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    // test data
    static func testData() -> [Item] {
        return [
            Item(name: "FA Deck", price: 65.00, category: .skateboarding),
            Item(name: "Nice Chair", price: 200.00, category: .household),
            Item(name: "Hacking with Swift", price: 69.00, category: .education),
            Item(name: "Vitamins", price: 17.00, category: .health)
        ]
    }
}
