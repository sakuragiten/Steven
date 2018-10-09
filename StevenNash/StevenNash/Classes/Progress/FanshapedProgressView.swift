//
//  FanshapedProgressView.swift
//  StevenNash
//
//  Created by gongsheng on 2018/10/9.
//  Copyright © 2018 gongsheng. All rights reserved.
//

import UIKit

class FanshapedProgressView: UIView {

    //进度
    var progress: Double = 0.0 {
        didSet {
            resetLayerWithProgress(progress)
        }
    }
    
    //背景色
    var bgColor: UIColor = .lightGray
    
    //进度颜色
    var progressColor: UIColor = .red
    
    //shapeLayer
    var progressLayer: CAShapeLayer!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        progressLayer = CAShapeLayer()
        progressLayer.fillColor = progressColor.cgColor
        self.layer.addSublayer(progressLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = circlrPathWithProgress(1.0)
        bgColor.setFill()
        path.fill()
    }
    
}


extension FanshapedProgressView {
    
    
    private func resetLayerWithProgress(_ progress : Double) {
        let path = circlrPathWithProgress(progress)
        let original = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        path.addLine(to: original)
        path.close()
        progressLayer.path = path.cgPath
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
