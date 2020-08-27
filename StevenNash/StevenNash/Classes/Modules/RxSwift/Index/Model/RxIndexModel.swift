//
//  RxIndexModel.swift
//  StevenNash
//
//  Created by Daniel on 2020/6/13.
//  Copyright © 2020 gongsheng. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RxIndexModel {
    
    var title: String = ""
    var className: String = ""
    
    init(title: String, className: String) {
        self.title = title
        self.className = className
    }
    
    public class func example() -> [RxIndexModel] {
//        let examples = Observable.just(
//            [[""], [""]].enumerated().map{self.init(title: $0, className: $1)}
//        )
        
        var result = [RxIndexModel]()
        result.append(RxIndexModel.init(title: "lesson_1", className: "RxTableViewBindController"))
        result.append(RxIndexModel.init(title: "lesson_2", className: "RxBasicViewController"))
        return result
    }
}
