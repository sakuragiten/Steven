//
//  MenuTableViewController.swift
//  StevenNash
//
//  Created by gongsheng on 2018/10/8.
//  Copyright © 2018 gongsheng. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    private var dataArray = ["CircleProgressController"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

}

// MARK: - Table view data source
extension MenuTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "menu_cell")
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = dataArray[indexPath.row]
        
        return cell!
        
    }
}

// MARK: - Table View delegate
extension MenuTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // swift4中通过字符串名转化成类，需要在字符串名前加上项目的名称
//        let bundleName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
//        let className = bundleName! + "." + dataArray[indexPath.row]
        let vcName = getClassFromString(dataArray[indexPath.row]) as! UIViewController.Type
        let vc = vcName.instanceFromeXib()
        navigationController?.pushViewController(vc, animated: true)
    }
}
