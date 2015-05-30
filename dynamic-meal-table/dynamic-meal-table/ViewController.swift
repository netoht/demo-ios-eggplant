//
//  ViewController.swift
//  dynamic-meal-table
//
//  Created by Neto on 5/30/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let meals = ["eggplant brownie", "zucchini muffin"]
    
    override func viewDidLoad() {
        super.viewDidLoad() // quando você sobreescreve algum método da superclasse sempre chame o método da superclasse que você sobreescreveu
        println("view did load")
    }
    
    // com o table view você deve sobreescrever vários métodos para dizer como irá funcionar as table views
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal
        return cell
    }

}

