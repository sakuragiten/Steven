//
//  CircleProgressController.swift
//  StevenNash
//
//  Created by gongsheng on 2018/10/8.
//  Copyright © 2018 gongsheng. All rights reserved.
//

import UIKit

class CircleProgressController: UIViewController {
    @IBOutlet weak var testBtn: UIButton!
    
    private var circleView : CircleProgressView?
    
    private var fanView: FanshapedProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        circleView = CircleProgressView(frame: CGRect(x: 30, y: 100, width: 100, height: 100))
        circleView?.progress = 0.3
        circleView?.backgroundColor = UIColor.cyan
        self.view.addSubview(circleView!)
        
        fanView = FanshapedProgressView()
        fanView?.frame = CGRect(x: 130, y: 100, width: 100, height: 100)
        fanView?.progress = 0.3
        self.view.addSubview(fanView!)
        
        
    }
    
    @IBAction func testAction(_ sender: Any) {
        
        circleView?.progress = (circleView?.progress)! + 0.02
        if (circleView?.progress)! > CGFloat(1.01)  {
            circleView?.progress = 0
        }
        fanView.progress = fanView.progress + 0.02
        if fanView.progress > 1.01  {
            fanView.progress = 0
        }
        
    }

}

