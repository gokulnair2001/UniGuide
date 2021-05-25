//
//  UserViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 25/05/21.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var joinDate: UILabel!
    @IBOutlet weak var unicode: UILabel!
    @IBOutlet weak var proPack: UIView!
    
    var userName:String = ""
    var userMailID:String = ""
    var userJoinDate:String = ""
    var userID:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profile.layer.cornerRadius = 15
        view1.layer.cornerRadius = 15
        proPack.layer.cornerRadius = 10
        get()
    }
}


extension UserViewController {
    func get(){
        var request = URLRequest(url: URL(string: "https://source-uniguide-webapp.herokuapp.com/users/me")!,timeoutInterval: Double.infinity)
//        let userToken = defaults.object(forKey: key.values.userToken) as! String
        let userToken = MainViewController.userToken
        request.addValue(userToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                
                return
            }
            
            if let response = response as? HTTPURLResponse{
                guard (200 ... 299) ~= response.statusCode else {
                    print("Status code :- \(response.statusCode)")
                    //if error == 400 then applied for test again
                    return
                }
            }
            
            self.userName.removeAll()
            self.userMailID.removeAll()
            self.userJoinDate.removeAll()
            self.userID.removeAll()
            do{
                let result = try JSONDecoder().decode(profileModel.self, from: data)
                print(result)
                self.userName = result.name
                self.userMailID = result.email
                self.userJoinDate = result.createdAt
                self.userID = result.id
                
                DispatchQueue.main.async{
                self.updateUI()
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func updateUI() {
        self.nameLabel.text = userName
        self.mailLabel.text = userMailID
        self.joinDate.text = userJoinDate
        self.unicode.text = userID
    }
}
