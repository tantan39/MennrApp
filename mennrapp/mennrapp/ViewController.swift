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
        var items = [SpecificationItem]()
        if let json = SystemServices.shared().allSystemInformation {
            for (key, value) in json {
                items.append(SpecificationItem(title: key as? String ?? "", value: value))
            }
        }
        
        self.performSegue(withIdentifier: "showDetails", sender: items)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? DetailsViewController, let items = sender as? [SpecificationItem] {
            detailsVC.items = items
        }
    }
}

