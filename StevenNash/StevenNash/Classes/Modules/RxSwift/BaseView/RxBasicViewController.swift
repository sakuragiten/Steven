//
//  RxBasicViewController.swift
//  StevenNash
//
//  Created by Daniel on 2020/7/10.
//  Copyright © 2020 gongsheng. All rights reserved.
//

import UIKit

class RxBasicViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    

    func setupView() {
        self.view.backgroundColor = .white
        
        let btn = UIButton.init(frame: CGRect(x: 100, y: 100, width: 150, height: 50));
        btn.setTitle("Test", for: .normal)
        btn.backgroundColor = UIColor.brown
        view.addSubview(btn)
        
        btn.rx.tap.subscribe(onNext: {
            print("btn click !")
            self.testAction()
        }).disposed(by: disposeBag)
    }
    
    
    func testAction() {
        let subscription = Observable<Int>.interval(.seconds(1), scheduler: SerialDispatchQueueScheduler.init(internalSerialQueueName: "serial"))
            .subscribe { event in
                print("\(event)")
        }
        Thread.sleep(forTimeInterval: 4.0)
        
        debugPrint("release")
        subscription.dispose()
        
    }
}



