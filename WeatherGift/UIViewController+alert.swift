//
//  UIViewController+alert.swift
//  ToDo List
//
//  Created by Kyle Gangi on 3/6/20.
//  Copyright © 2020 Kyle Gangi. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func oneButtonAlert(title: String, message: String){
        
        let alertController = UIAlertController(title: title , message: message, preferredStyle: .alert)
                           let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                           alertController.addAction(defaultAction)
                           self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
}
