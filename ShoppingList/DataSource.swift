//
//  DataSource.swift
//  ShoppingList
//
//  Created by Brendon Cecilio on 7/15/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class DataSource: UITableViewDiffableDataSource <Category, Item> {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if Category.allCases[section] == .shoppingcart {
            return "🛒" + Category.allCases[section].rawValue
        } else {
            return Category.allCases[section].rawValue
        }
    }
}
