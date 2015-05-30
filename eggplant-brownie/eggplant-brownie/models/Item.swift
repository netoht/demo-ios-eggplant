//
//  Item.swift
//  eggplant-brownie
//
//  Created by Neto on 5/29/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import Foundation

/*
 Para utilizar o método find(array, item) que encontra um determinado item dentro de um array, a classe do tipo do array deve implementar o protocol
 Equatable e criar um método global (ou seja, fora da classe) ==(object_1: T, object_2: T) e fazer a comparação dentro dela 
 semelhante ao método equals do Java
*/
class Item : Equatable { // Equatable serve para a classe ser comparada

    let name:String
    let calories:Double

    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

func ==(first: Item, second: Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}