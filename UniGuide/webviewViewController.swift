//
//  webviewViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 27/05/21.
//

import UIKit
import WebKit

class webviewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = ProjectsViewController.selectedProj
        webView.load(URLRequest(url: URL(string: url)!))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   

}
