//
//  alertControllModel.swift
//  UniGuide
//
//  Created by Gokul Nair on 25/05/21.
//

import UIKit


extension UIViewController {
    func alertView (title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

