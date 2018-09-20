//
//  ViewController.swift
//  StevenNash
//
//  Created by gongsheng on 24/04/2018.
//  Copyright © 2018 gongsheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view = CircleProgressView(frame: CGRect(x: 30, y: 100, width: 100, height: 100))
        view.progress = 0.3
        
        view.backgroundColor = UIColor.cyan
        
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

