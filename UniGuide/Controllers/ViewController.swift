//
//  ViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 29/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var passTf: UITextField!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.layer.cornerRadius = 10
    }

    @IBAction func signInbtn(_ sender: Any) {
        validateFields()
    }
    
    @IBAction func webView(_ sender: Any) {
        self.performSegue(withIdentifier: "webViewp", sender: nil)
    }
}

extension ViewController {

        func validateFields() {
                if emailtf.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passTf.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    postAction()
                }else{
                    alertView(title: "Error", message: "Please fill in all the fields.")
                }
            
        }
        
        func postAction() {
            let pass = passTf.text
            let email = emailtf.text
            
            let Url = String("https://source-uniguide-webapp.herokuapp.com/users/login")
            guard let serviceUrl = URL(string: Url) else { return }
            let parameters = ["email": email,   "password": pass]
            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                return
            }
            request.httpBody = httpBody
            
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response as? HTTPURLResponse{
                    
                    guard (200 ... 299) ~= response.statusCode else {
                        print("Status code :- \(response.statusCode)")
                        
                        if response.statusCode == 400 {
                            DispatchQueue.main.async {
                                
                            }
                        }else if response.statusCode == 401{
                            DispatchQueue.main.async {
                            }
                        }
                        return
                    }
                }
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        self.parseMesg(data)
                        print(json)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    func parseMesg(_ data: Data){
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(loginModel.self, from: data)
            
            MainViewController.userToken = decodedData.token
            print("user token: \(MainViewController.userToken)")
            
            DispatchQueue.main.async {
                let vc = self.storyboard?.instantiateViewController(identifier: "mains") as! UITabBarController
                self.navigationController?.present(vc, animated: true)
                self.emailtf.text?.removeAll()
                self.passTf.text?.removeAll()
            }
        }catch{
            print(error.localizedDescription)
        }
    }
}
