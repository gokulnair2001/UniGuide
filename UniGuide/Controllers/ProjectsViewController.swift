//
//  ProjectsViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 25/05/21.
//

import UIKit

class ProjectsViewController: UIViewController, didUpdateResults {
    func updateResults(tagNo: Int) {
        switch tagNo {
        case 0:
            projectName = bct
        case 1:
            projectName = ai
        case 2:
            projectName = crypto
        case 3:
            projectName = cs
        case 4:
            projectName = iot
        default:
            projectName = copydata
        }
        self.tableView.reloadData()
    }
    

    var projectName:[String] = ["BCT India Strategy","BCT HyperLedger Fabric","AI for Social Use","BCT Network","Creativity in AI","IOT is Revolutionary","Cyber Security is Emerging","Bitcoin is Scalable","Intro to Cyber Security","Bitcoin's Backbone"]
    
    var copydata = ["BCT India Strategy","BCT HyperLedger Fabric","AI for Social Use","BCT Network","Creativity in AI","IOT is Revolutionary","Cyber Security is Emerging","Bitcoin is Scalable","Intro to Cyber Security","Bitcoin's Backbone"]
    
    var iot = ["IOT is Revolutionary"]
    var bct = ["BCT India Strategy","BCT HyperLedger Fabric","BCT Network"]
    var crypto = ["Bitcoin is Scalable","Bitcoin's Backbone"]
    var cs = ["Intro to Cyber Security","Cyber Security is Emerging"]
    var ai = ["AI for Social Use","Creativity in AI"]
    
    var projectLink:[String] = ["","","","","","","","","",""]
    var projectImage:[UIImage] = [#imageLiteral(resourceName: "cover3"),#imageLiteral(resourceName: "cover3"),#imageLiteral(resourceName: "cover2"),#imageLiteral(resourceName: "cover1")]
   
    let searchController = UISearchController(searchResultsController: nil)
    
    static var selectedProj:String = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
   
    @IBAction func segmentAction(_ sender: Any) {
        
        if segment.selectedSegmentIndex == 0 {
            projectName = ["BCT India Strategy","BCT HyperLedger Fabric","AI for Social Use","BCT Network","Creativity in AI","IOT is Revolutionary","Cyber Security is Emerging","Bitcoin is Scalable","Intro to Cyber Security","Bitcoin's Backbone"]
            tableView.reloadData()
        }
    }
    
    @IBAction func reloadBtn(_ sender: Any) {
        projectName = ["BCT India Strategy","BCT HyperLedger Fabric","AI for Social Use","BCT Network","Creativity in AI","IOT is Revolutionary","Cyber Security is Emerging","Bitcoin is Scalable","Intro to Cyber Security","Bitcoin's Backbone"]
        tableView.reloadData()
    }
    @IBAction func uploadRepoBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "upload", sender: nil)
    }
    @IBAction func filterButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "tagView") as! filterViewController
        vc.modalPresentationStyle = .automatic
        vc.tagDelegate = self
        present(vc, animated: true, completion: nil)
    }
}


extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! pjTableViewCell
        cell.pjNameLbl.text = projectName[indexPath.row]
        cell.pjImage.image = projectImage.randomElement()
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

extension ProjectsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        if searchText.isEmpty {
          projectName = ["BCT India Strategy","BCT HyperLedger Fabric","AI for Social Use","BCT Network","Creativity in AI","IOT is Revolutionary","Cyber Security is Emerging","Bitcoin is Scalable","Intro to Cyber Security","Bitcoin's Backbone"]
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }else {
            projectName = filterBy(option: 0, text: searchText)
        }
        tableView.reloadData()
    }
    func filterBy(option:Int, text:String) -> [String]{
        projectName = copydata.filter({ (mod) -> Bool in
            return mod.lowercased().contains(text.lowercased())
        })
        return projectName
    }
}
