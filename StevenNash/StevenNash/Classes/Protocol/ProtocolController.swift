//
//  ProtocolController.swift
//  StevenNash
//
//  Created by gongsheng on 2018/10/9.
//  Copyright © 2018 gongsheng. All rights reserved.
//

import UIKit

class ProtocolController: UIViewController , Emitterable {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func testAction(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        sender.setTitle(sender.isSelected ? "Stop" : "Start", for: .normal)
        
        let point = CGPoint(x: self.view.bounds.width * 0.5, y: self.view.bounds.height - 20)
        sender.isSelected ? startEmittering(point) : stopEmittering()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
