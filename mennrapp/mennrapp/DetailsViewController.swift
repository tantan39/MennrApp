//
//  DetailsViewController.swift
//  mennrapp
//
//  Created by Tan Tan on 5/28/22.
//

import Foundation
import UIKit

struct SpecificationItem: Decodable {
    let title: String
    let value: String
}

class DetailsViewController: UITableViewController {
    var items: [SpecificationItem] = [
        SpecificationItem(title: "title1", value: "ram"),
        SpecificationItem(title: "title2", value: "processor")
    ]
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = items[indexPath.row]
        print("\(item.title) -- \(item.value)")
        return cell
    }
}
