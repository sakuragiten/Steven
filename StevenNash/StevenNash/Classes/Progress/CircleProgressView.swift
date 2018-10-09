//
//  CircleProgressView.swift
//  StevenNash
//
//  Created by gongsheng on 2018/9/20.
//  Copyright © 2018 gongsheng. All rights reserved.
//

import UIKit

class CircleProgressView: UIView {
    
    //进度
    var progress : CGFloat = 0.0 {
        didSet {
            resetLayerWithProgress(progress)
        }
    }
    
    //进度条的颜色
    var progressColor : UIColor = .red
    
    private var progressLayer : CAShapeLayer?
    
    
    
    override func draw(_ rect: CGRect) {
        let path = circlrPathWithProgress(1.0)
        path.lineWidth = 1.0
        UIColor.lightGray.setStroke()
        path.stroke()
    }
    
    
    private func resetLayerWithProgress(_ progress : CGFloat) {
        
        let path = circlrPathWithProgress(Double(progress))
        if progressLayer == nil {
            progressLayer = CAShapeLayer()
            progressLayer?.strokeColor = self.progressColor.cgColor
            progressLayer?.fillColor = UIColor.clear.cgColor
            progressLayer?.lineWidth = 3.0
            self.layer.addSublayer(progressLayer!)
        }
        progressLayer?.path = path.cgPath
  
    }
    
    private func circlrPathWithProgress(_ progress : Double) -> UIBezierPath {
        
        let original = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        
        let radius = self.bounds.size.width * 0.5 - 2.0
        let startAngle = -(Double.pi / 2.0)
        let endAngle = startAngle + progress * Double.pi * 2.0
        
        let path = UIBezierPath(arcCenter: original, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        
        
        return path
    }
    
}
