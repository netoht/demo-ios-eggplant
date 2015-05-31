//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Neto on 5/28/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate { // um tipo de interface do Java, o padrão de nome seria o nome da view seguido de Delegate
    func add(meal: Meal)
}

protocol AddAMealDelegate {
    func add(meal: Meal)
}

// UITableViewDataSource implementado para ser utilizado na table view
// UITableViewDelegate implementado para ser utilizado como delegate na table view
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    @IBOutlet var tableView:UITableView?
    var delegate: AddAMealDelegate? // utilizando o padrão protocol
    var items = Array<Item>()
    var selected = Array<Item>()
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("showNewItem"))
        
        navigationItem.rightBarButtonItem = newItemButton
        
        self.items = Dao().loadItems()
    }
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller:self).show()
        }
    }
    
    func add(item: Item) {
        items.append(item)
        Dao().saveItems(items)
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller:self).show(message: "Unexpected error, but the item was added")
        }
    }
    
    func getMealFromForm() -> Meal? {
        if nameField == nil || happinessField == nil {
            return nil
        }
        
        let name = nameField!.text
        let happiness = happinessField!.text.toInt()
        
        if happiness == nil {
            return nil
        }
        
        let meal = Meal(name: name, happiness: happiness!)
        meal.items = selected
        
        println("eaten: \(meal.name), \(meal.happiness), \(meal.items)")
        
        return meal;
    }
    
    @IBAction func add() {
        if let meal = getMealFromForm() {  // essa é uma boa prática para extrair o valor de um optional
            if let meals = delegate {
                meals.add(meal)
                if let navigation = self.navigationController {
                    navigation.popViewControllerAnimated(true)
                } else {
                    Alert(controller: self).show(message: "Unexpected error, but the meal was added.")
                }
                return
            }
        }
        Alert(controller: self).show()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item:Item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
        
            let item = items[indexPath.row]
            if cell.accessoryType == UITableViewCellAccessoryType.None {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                selected.append(item)
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.None
                if let position = find(selected, item) {
                    selected.removeAtIndex(position)
                } else {
                    Alert(controller:self).show()
                }
            }
        } else {
            Alert(controller:self).show()
        }
    }
}