//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Neto on 5/30/15.
//  Copyright (c) 2015 Neto. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    func show(message: String = "Unexpected error, Be careful.") {
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "Understood", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(ok)
        controller.presentViewController(alert, animated: true, completion: nil)
    }
}