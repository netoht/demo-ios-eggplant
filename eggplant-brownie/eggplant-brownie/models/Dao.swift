//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Neto on 5/31/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import Foundation

class Dao {
    
    let mealsArchive: String
    let itemsArchive: String
    
    init() {
        let userDirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let dir = userDirs[0] as String
        self.mealsArchive = "\(dir)/eggplant-brownie-meals"
        self.itemsArchive = "\(dir)/eggplant-brownie-items"
    }
    
    func saveMeals(meals: Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    func loadMeals() -> Array<Meal> {
        if let loaded: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive) {
            return loaded as Array
        }
        return Array<Meal>()
    }

    func saveItems(items: Array<Item>) {
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    
    func loadItems() -> Array<Item> {
        if let loaded: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive) {
            return loaded as Array
        }
        return Array<Item>()
    }

}