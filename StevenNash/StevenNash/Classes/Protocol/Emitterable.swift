//
//  Emitterable.swift
//  StevenNash
//
//  Created by gongsheng on 2018/10/9.
//  Copyright © 2018 gongsheng. All rights reserved.
//


/*
 1.什么是粒子系统？
 粒子系统是由总体具有相同的表现规律，个体却随机表现出不同的特征的大量显示元素构成的集合。
 2.粒子定义有三要素
 2.1群体性：粒子系统是由“大量显示元素”构成的(例如雪、雨、一团雾等等)
 2.2统一性：粒子系统的每个元素具有相同的表现规律(例如下雨、下雪，方向都是从上向下)
 2.3随机性：粒子系统的每个元素又随机表现出不同特征(例如下雪，每个雪花下落的速度会有不同，大小会有不同、方向也会有略微的不同)
 3.应用:
 主播房间右下角粒子动画
 雪花/下雨/烟花等效果
 QQ生日快乐一堆表情的跳动
 
 4.粒子系统的使用
 步骤:
 4.1创建发射器
 4.2创建粒子, 设置粒子属性
 
 (这里我使用了协议将粒子动画封装起来, 在使用的VC遵守Emitterable协议即可使用)
 */

import UIKit

protocol Emitterable {
    
}


extension Emitterable where Self : UIViewController {
    
    func startEmittering(_ point: CGPoint) {
        //1.创建发射器
        let emitter = CAEmitterLayer()
        
        //2.设置发射器的位置
        emitter.emitterPosition = point
        
        //3.开启三维效果
        emitter.preservesDepth = true
        
        //4.创建粒子 并设置粒子的相关属性
        var cells = [CAEmitterCell]()
        for i in 0..<10 {
            //4.1创建粒子
            let cell = CAEmitterCell()
            
            //4.2设置粒子速度
            cell.velocity = 150
            cell.velocityRange = 100
            
            //4.3设置粒子的大小
            cell.scale = 0.7
            cell.scaleRange = 0.3
            
            //4.4设置粒子的方向
            cell.emissionLongitude = CGFloat(-(Double.pi / 2))
            cell.emissionRange = CGFloat((Double.pi / 2) / 6)
            
            //4.5设置粒子存活时间
            cell.lifetime = 3
            cell.lifetimeRange = 1.5
            
            //4.6设置粒子旋转
            cell.spin = CGFloat(Double.pi / 2)
            cell.spinRange = CGFloat((Double.pi / 2) / 2)
            
            //4.7设置粒子每秒弹出的个数
            cell.birthRate = 2
            
            //4.8 设置粒子的展示图片
            cell.contents = UIImage(named: "good\(i)_30x30")?.cgImage
            
            //4.9 添加到数组中
            cells.append(cell)
        }
        
        //5. 将粒子设置到发射器中
        emitter.emitterCells = cells
        
        //6. 将发射器的layer添加到父layer中
        view.layer.addSublayer(emitter)
    }
    
    
    
    func stopEmittering() {
        view.layer.sublayers?.filter({$0.isKind(of: CAEmitterLayer.self)}).first?.removeFromSuperlayer()
    }
    
}
