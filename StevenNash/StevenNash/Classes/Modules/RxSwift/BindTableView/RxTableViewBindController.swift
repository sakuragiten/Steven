//
//  RxTableViewBindController.swift
//  StevenNash
//
//  Created by Daniel on 2020/7/9.
//  Copyright © 2020 gongsheng. All rights reserved.
//

import UIKit



class RxTableViewBindController: ViewController {

    private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setuView()
        bindView()
    }
    

    func setuView() {
        self.view.backgroundColor = .white
        
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        self.view.addSubview(tableView)
        
    }
    
    func bindView() {
        let items = Observable.just(
            (0..<20).map{"\($0)"}
        )
        items
            .bind(to: tableView.rx.items(cellIdentifier: "reuseCell", cellType: UITableViewCell.self)){ (_, element, cell) in
                cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
                cell.textLabel?.text = "line of number is \(element)"
        }.disposed(by: disposeBag)
        
        
    }
}
