//
//  ProjectsViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 25/05/21.
//

import UIKit

class ProjectsViewController: UIViewController {

    var projectName:[String] = ["BC: India's Strategy","Blockchain Technology","BCT: HyperLedger Fabric"]
    var projectLink:[String] = ["https://drive.google.com/file/d/1A0LKzU-t53b4nVGfHnbH8Fb42s6UtyR-/view?usp=sharing","https://drive.google.com/file/d/1TKuw9z-chVPCtd2_7_vdYfrCuMjC9MJO/view?usp=sharing","https://drive.google.com/file/d/1EJP0Ppl3FAk2wXxmVrfKcaCmgzK1BtpV/view?usp=sharing"]
    var projectImage:[UIImage] = [#imageLiteral(resourceName: "pj1"),#imageLiteral(resourceName: "pj2"),#imageLiteral(resourceName: "pj3")]
    var projYear:[String] = ["2020","2021","2019"]
    
    static var selectedProj:String = ""
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 10
//        view1.layer.borderWidth = 0.4
//        view1.layer.borderColor = UIColor.black.cgColor
        
        view2.layer.cornerRadius = 10
//        view2.layer.borderWidth = 0.4
//        view2.layer.borderColor = UIColor.black.cgColor
//
        view3.layer.cornerRadius = 10
//        view3.layer.borderWidth = 0.4
//        view3.layer.borderColor = UIColor.black.cgColor
        
        view4.layer.cornerRadius = 10
//        view4.layer.borderWidth = 0.4
//        view4.layer.borderColor = UIColor.black.cgColor
        
        tableView.delegate = self
        tableView.dataSource = self
    }
   

    @IBAction func uploadRepoBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "upload", sender: nil)
    }
}


extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! pjTableViewCell
        cell.pjNameLbl.text = projectName[indexPath.row]
        cell.pjImage.image = projectImage[indexPath.row]
        cell.yearlLbl.text = projYear[indexPath.row]
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ProjectsViewController.selectedProj = projectLink[indexPath.row]
        self.performSegue(withIdentifier: "showProj", sender: nil)
    }
}
