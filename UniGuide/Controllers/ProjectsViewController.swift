//
//  ProjectsViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 25/05/21.
//

import UIKit

class ProjectsViewController: UIViewController {

   
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 5
        view1.layer.borderWidth = 0.4
        view1.layer.borderColor = UIColor.black.cgColor
        
        view2.layer.cornerRadius = 5
        view2.layer.borderWidth = 0.4
        view2.layer.borderColor = UIColor.black.cgColor
        
        view3.layer.cornerRadius = 5
        view3.layer.borderWidth = 0.4
        view3.layer.borderColor = UIColor.black.cgColor
        
        view4.layer.cornerRadius = 5
        view4.layer.borderWidth = 0.4
        view4.layer.borderColor = UIColor.black.cgColor
    }
   

}
