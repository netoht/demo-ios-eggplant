//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Neto on 5/29/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import Foundation

class Meal {
    
    let name:String
    let happiness:Int
    var items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}