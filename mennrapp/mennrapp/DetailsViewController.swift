//
//  DetailsViewController.swift
//  mennrapp
//
//  Created by Tan Tan on 5/28/22.
//

import Foundation
import UIKit

struct SpecificationItem {
    let title: String
    let value: Any
}

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
}

class DetailsViewController: UITableViewController {
    var items: [SpecificationItem] = []
    
    override func viewDidLoad() {
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let item = items[section]
        return item.title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else { return UITableViewCell() }
        let item = items[indexPath.section]
        cell.lblTitle.text = "\(item.value)"
        return cell
    }
}
