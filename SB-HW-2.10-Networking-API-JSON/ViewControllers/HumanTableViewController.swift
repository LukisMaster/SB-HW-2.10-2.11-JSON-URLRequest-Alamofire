//
//  HumanTableViewController.swift
//  SB-HW-2.10-Networking-API-JSON
//
//  Created by Sergey Nestroyniy on 06.10.2022.
//

import UIKit

class HumanTableViewController: UITableViewController {
    
    var human : ToolCartonData!
    var properties : [String] = []
    var avatarImage : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.rowHeight = 60
        properties = human.getInfo()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return human.getInfo().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        
        
        if indexPath.row == 0 {
            cell.imageView?.image = avatarImage
            cell.textLabel?.text = human.name
        }
        else {
            cell.textLabel?.text = properties[indexPath.row - 1]
            cell.textLabel?.numberOfLines = 5
        }
        return cell
    }

}
