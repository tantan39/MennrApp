//
//  ItemCell.swift
//  mennrapp
//
//  Created by Tan Tan on 5/28/22.
//

import UIKit

struct SpecificationItem {
    let title: String
    let value: Any
}

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
}
