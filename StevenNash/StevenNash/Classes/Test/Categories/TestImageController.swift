//
//  TestImageController.swift
//  StevenNash
//
//  Created by gongsheng on 2018/10/18.
//  Copyright © 2018 gongsheng. All rights reserved.
//

import UIKit

class TestImageController: UIViewController {



    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let sourceImage = UIImage(named: "girl.jpg")!
        imageView.image = sourceImage.convertToGrayscale()
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
