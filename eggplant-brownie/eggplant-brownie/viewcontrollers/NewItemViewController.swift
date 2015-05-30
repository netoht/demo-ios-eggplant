//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Neto on 5/30/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate {
    func add(item: Item)
}

class NewItemViewController: UIViewController {

    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesField: UITextField?
    var delegate: AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate) {
        // para conectar a classe swift de controller com seu xib file você deve informar no
        // construtor os parâmentros nibName com o nome do arquivo xib e bundle com null
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    // você é obrigado a implementar esse construtor pois herda de UIViewController
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func addNewItem() {
        if nameField == nil || caloriesField == nil {
            return
        }
        
        let name = nameField!.text
        let calories = NSString(string: caloriesField!.text).doubleValue
        
        let item = Item(name: name, calories: calories)
        
        if delegate == nil {
            return
        }
        delegate!.add(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
}
