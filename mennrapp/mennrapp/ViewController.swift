//
//  ViewController.swift
//  mennrapp
//
//  Created by Tan Tan on 5/27/22.
//

import UIKit
import SystemServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func scanButton_Pressed(_ sender: Any) {
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }
    
}

