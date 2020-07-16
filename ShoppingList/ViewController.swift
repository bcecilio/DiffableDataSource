//
//  ViewController.swift
//  ShoppingList
//
//  Created by Brendon Cecilio on 7/15/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView!
    private var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureDataSource()
    }
    
    private func configureNavBar() {
        navigationItem.title = "Shopping List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditState))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddVC))
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { (tableView, indexPath, item) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "\(item.name)"
            return cell
        })
        
        dataSource.defaultRowAnimation = .fade
        
        var snapshot = NSDiffableDataSourceSnapshot<Category, Item>()
        
        // populate snapshot with sections and items for each section
        // CaseIterable allows us to iterate through all the cases of the enum
        for category in Category.allCases {
            // query the testData() [items] for that particular category's item
            let items = Item.testData().filter {$0.category == category}
            snapshot.appendSections([category])
            snapshot.appendItems(items)
        }
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    @objc private func toggleEditState() {
        
    }
    
    @objc private func presentAddVC(){
        // 1. create an addVC swift file
        // 2. add a view controller object in storyboard
        /// 3. add 2 text fields (item name + item price)
        // 4. add a pickerView to manage the categories
        // 5. create submit button
        // 6. user is able to add a new item to a given category
        // 7. use any communication protocol to get data from addVC back to the VC
    }
}

