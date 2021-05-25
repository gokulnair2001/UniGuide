//
//  MainViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 14/04/21.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static var userToken:String = ""
    
    var suggestedBookImage = ["s1","s2","s3","s4","s5","s6","s7"]
    var suggestedBookName = ["Engineering Journal","Electrical Engineering","Engineering Studies","Software Engineering","Systems Engineering","ELectronics Journal","Computer Engineering"]
    var suggestedBookCode = ["UG9897","UG565","UG8732","UG2341","UG6765","UG7864","UG6969"]
    
    var bookImg = ["b1","b2","b3","b4","b5","b6","b7"]
    var bookCode = ["UG001", "UG002","UG003","UG004","UG005","UG006","UG007"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    


}

extension MainViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookCode.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "book", for: indexPath) as! bookCollectionViewCell
        cell.bookImage.image = UIImage(named: bookImg[indexPath.row])
        cell.bookCode.text = bookCode[indexPath.row]
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = true
        cell.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: 140, height: 242)
        return cellSize
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookCode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! suggestedTableViewCell
        cell.bookImg.image = UIImage(named: suggestedBookImage[indexPath.row])
        cell.projName.text = suggestedBookName[indexPath.row]
        cell.projCode.text = suggestedBookCode[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
