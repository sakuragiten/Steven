//
//  MenuTableViewController.swift
//  StevenNash
//
//  Created by gongsheng on 2018/10/8.
//  Copyright © 2018 gongsheng. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    private var dataArray = ["RxIndexController", "TestLottieController", "TestCategoriesController", "CircleProgressController", "ProtocolController"]
    private var dataSource = [("RxSwift", "RxIndexController"),
                              ("Lottie", "TestLottieController"),
                              ("Categories", "TestCategoriesController"),
                              ("Progress", "CircleProgressController"),
                              ("Protocol", "ProtocolController"),
                              ("MVC", "GSToDoViewController")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = "Test"
    }

}

// MARK: - Table view data source
extension MenuTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "menu_cell")
            cell?.selectionStyle = .none
        }
        let (key, _) = dataSource[indexPath.row]
        cell?.textLabel?.text = key
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
        return cell!
        
    }
}

// MARK: - Table View delegate
extension MenuTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // swift4中通过字符串名转化成类，需要在字符串名前加上项目的名称
//        let bundleName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
//        let className = bundleName! + "." + dataArray[indexPath.row]
        let (_, value) = dataSource[indexPath.row]
        let vcName = getClassFromString(value) as! UIViewController.Type
        var vc: UIViewController?
        if (Bundle.main.path(forResource: value, ofType: "nib") != nil) {
            vc = vcName.instanceFromeXib()
        } else {
            vc = vcName.init()
        }
        
        
//        let vc = indexPath.row > 2 ? vcName.instanceFromeXib() : vcName.init()
        let (name, _) = dataSource[indexPath.row]
        vc?.title = name
        navigationController?.pushViewController(vc!, animated: true)
    }
}
