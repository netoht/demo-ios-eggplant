//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Neto on 5/30/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {

    var meals = Array<Meal>()
    
    func add(meal: Meal) {
        meals.append(meal)
        Dao().saveMeals(meals)
        
        tableView.reloadData() // para que a tabela seja redesenhada deve, o método reloadData da tableView deve ser executado
    }
    
//    [
//    Meal(name: "eggplant brownie", happiness: 5),
//    Meal(name: "zucchini muffin", happiness: 3)
//    ]
    
    override func viewDidLoad() {
        self.meals = Dao().loadMeals()
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
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showDetails:")) // para o Selector passar parâmetros para a sua função o nome do método deve ser terminado com dois pontos ":"
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Began { // long press em uma celula, status de inicio
            let cell = recognizer.view as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            if indexPath == nil {
                return
            }
            let row = indexPath!.row
            let meal = meals[row]
            
            RemoveMealController(controller: self).show(meal, {
                action in // a palavra reservada in é para dizer que começou o codigo da closure
                self.meals.removeAtIndex(row)
                self.tableView.reloadData() // sempre tem que atualizar a tela para o usuario apos uma ação
            })
        }
    }
}
