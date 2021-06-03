//
//  filterViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 03/06/21.
//

import UIKit

protocol  didUpdateResults {
    func updateResults(tagNo: Int)
}

class filterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tagNAme:[String] = ["BCT : Blockchain Technology","AI : Artificial Intelligence","CPT : Cryptocurrency","CS : Cyber Security","IOT : Internet of Things"]
    var projCount = [3,2,2,2,1]
    
    var tagDelegate: didUpdateResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
  
}

extension filterViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagNAme.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celllsss", for: indexPath) as! tagTableViewCell
        cell.projName.text = tagNAme[indexPath.row]
        cell.projno.text = "\(projCount[indexPath.row])"
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tag = Int("\(indexPath.row)")
        tagDelegate?.updateResults(tagNo: tag!)
        self.dismiss(animated: true, completion: nil)
    }
    
}
