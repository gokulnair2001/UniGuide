//
//  uploadViewController.swift
//  UniGuide
//
//  Created by Gokul Nair on 26/05/21.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class uploadViewController: UIViewController, UIDocumentInteractionControllerDelegate, UIDocumentPickerDelegate {
   
    let documentInteractionController = UIDocumentInteractionController()
    
    @IBOutlet weak var upBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        upBtn.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    @IBAction func addFile(_ sender: Any) {
       
    }
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
