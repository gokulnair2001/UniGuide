//
//  signUpWebViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 25/05/21.
//

import UIKit
import WebKit

class signUpWebViewController: UIViewController {

   
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://source-uniguide-webapp.herokuapp.com/sign-up"
        webView.load(URLRequest(url: URL(string: url)!))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
