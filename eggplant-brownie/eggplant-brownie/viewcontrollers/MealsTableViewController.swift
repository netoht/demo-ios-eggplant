//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Neto on 5/30/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {

    var meals = [
        Meal(name: "eggplant brownie", happiness: 5),
        Meal(name: "zucchini muffin", happiness: 3)
    ]
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData() // para que a tabela seja redesenhada deve, o método reloadData da tableView deve ser executado
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal" {
            let view = segue.destinationViewController as ViewController // segue significa a ligação das telas no storyboard (as setas)
            view.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        return cell
    }
}
