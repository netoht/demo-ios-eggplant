//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Neto on 5/29/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import Foundation

class Meal : NSObject, NSCoding { // NSCoding requer se a classe adote o protocolo NSObject para o objeto ser serializado
    
    let name:String
    let happiness:Int
    var items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    required init(coder aDecoder: NSCoder) { // deve ter um construtor para deserializar o objeto, e deve ser required pois se alguem herdar essa classe ela também deve ter esse construtor
        self.name = aDecoder.decodeObjectForKey("name") as String
        self.happiness = aDecoder.decodeIntegerForKey("happiness")
        self.items = aDecoder.decodeObjectForKey("items") as Array
    }
    
    func encodeWithCoder(aCoder: NSCoder) { // esse método serializa os objetos
        aCoder.encodeObject(name, forKey: "name") // aqui serializa atributo por atributo
        aCoder.encodeInteger(happiness, forKey: "happiness")
        aCoder.encodeObject(items, forKey: "items")
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(happiness)"
        
        for item in items {
            message += "\n * \(item.name) - \(item.calories) calories"
        }
        return message
    }
}