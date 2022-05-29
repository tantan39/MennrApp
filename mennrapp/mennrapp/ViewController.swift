//
//  ViewController.swift
//  mennrapp
//
//  Created by Tan Tan on 5/27/22.
//

import UIKit
import SystemServices

public struct Units {
    public let bytes: UInt64
    public var kilobytes: Double {
        return Double(bytes) / 1_024
    }
    public var megabytes: Double {
        return kilobytes / 1_024
    }
    public var gigabytes: Double {
        return megabytes / 1_024
    }
    public init(bytes: UInt64) {
        self.bytes = bytes
    }
    public func getReadableUnit() -> String {
        switch bytes {
        case 0..<1_024:
            return "\(bytes) bytes"
        case 1_024..<(1_024 * 1_024):
            return "\(String(format: "%.2f", kilobytes)) kb"
        case 1_024..<(1_024 * 1_024 * 1_024):
            return "\(String(format: "%.2f", megabytes)) mb"
        case (1_024 * 1_024 * 1_024)...UInt64.max:
            return "\(String(format: "%.2f", gigabytes)) gb"
        default:
            return "\(bytes) bytes"
        }
    }
}

class ViewController: UIViewController {
    private var storeURL: URL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("Specification.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Fetching specification from local and populated to details view
    
    @IBAction func scanButton_Pressed(_ sender: Any) {
        var items = [SpecificationItem]()
        if let json = SystemServices.shared().allSystemInformation {
            for (key, value) in json {
                items.append(SpecificationItem(title: key as? String ?? "", value: value))
            }
            
            if let data = json.description.data(using: .utf8) {
                try! data.write(to: storeURL)
            }
        }
        
        let ramUsed = SpecificationItem(title: "Used", value: Units(bytes: UInt64(get_memory_used())).getReadableUnit())
        let ramFree = SpecificationItem(title: "Free", value: Units(bytes: UInt64(get_memory_free())).getReadableUnit())
        let ramTotal = SpecificationItem(title: "Total", value: Units(bytes: UInt64(get_memory_total())).getReadableUnit())
        
        items.append(contentsOf: [ramUsed, ramFree, ramTotal])
        
        self.performSegue(withIdentifier: "showDetails", sender: items)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? DetailsViewController, let items = sender as? [SpecificationItem] {
            detailsVC.items = items
        }
    }
}

