//
//  RxIndexController.swift
//  StevenNash
//
//  Created by Daniel on 2020/6/12.
//  Copyright © 2020 gongsheng. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxIndexController: ViewController {
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
        bindView()
        
//        RxIndexModel.example(<#T##self: RxIndexModel##RxIndexModel#>)
        
    }
    

    
    
    private func setupUI() {
        self.view.backgroundColor = .white
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableView.Style.plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        self.view.addSubview(tableView)
    }
    
    private func bindView() {
        let items = Observable.just(
            (0..<20).map{"\($0)"}
        )
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: "reuseCell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "line of number \(element)"
        }.disposed(by: disposeBag)
        
        
        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext: { value in
                print("Tapped '\(value)'")
            })
            .disposed(by: disposeBag)
    }

}
