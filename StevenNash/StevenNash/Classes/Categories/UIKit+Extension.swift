//
//  UIKit+Extension.swift
//  StevenNash
//
//  Created by gongsheng on 2018/10/18.
//  Copyright © 2018 gongsheng. All rights reserved.
//

import UIKit


enum PIXELS {
    case ALPHA, BLUE, GREEN, RED
}

extension UIImage {
    
    //图片置灰
    func convertToGrayscale() -> UIImage {
        let size = self.size
        let width = Int(size.width)
        let height = Int(size.height)
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.none.rawValue)
        context?.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let cgImage = context!.makeImage()
        let grayImage = UIImage(cgImage: cgImage!)
        return grayImage
    }
    
}
