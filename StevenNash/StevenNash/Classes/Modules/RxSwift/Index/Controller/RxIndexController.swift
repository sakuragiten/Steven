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
        
        closureTest {
            print("xixixixixi")
            print($0)
            return "LLLLLLLLLL"
        }
        
        
    }
    
    func closureTest(closure: (_ s1: String) -> String) {
        print("111111111111111")
        let res = closure("TTTTTT")
        print(res)
    }
    
    
    

    
    
    private func setupUI() {
        self.view.backgroundColor = .white
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableView.Style.plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        self.view.addSubview(tableView)
    }
    
    private func bindView() {
        
        
        let dataArray:Observable<[RxIndexModel]> = Observable.from(optional: RxIndexModel.example())
        
        dataArray.bind(to: tableView.rx.items(cellIdentifier: "reuseCell", cellType: UITableViewCell.self)){ (_, element, cell) in
            cell.textLabel?.text = element.title
            cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        }.disposed(by: disposeBag)
//        let items = Observable.just(
//            (0..<20).map{"\($0)"}
//        )
        
//        items
//            .bind(to: tableView.rx.items(cellIdentifier: "reuseCell", cellType: UITableViewCell.self)) { (row, element, cell) in
//                cell.textLabel?.text = "line of number \(element)"
//        }.disposed(by: disposeBag)
//
        
        tableView.rx
            .modelSelected(RxIndexModel.self)
            .subscribe(onNext: { value in
//                let vcName = getClassFromString(dataArray[indexPath.row]) as! UIViewController.Type
                let vcClass = self.getClassFromString(value.className) as! UIViewController.Type
                let vc = vcClass.init()
                vc.title = value.title
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
    }

}
