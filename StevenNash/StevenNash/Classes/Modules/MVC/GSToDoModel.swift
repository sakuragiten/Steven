//
//  GSToDoModel.swift
//  StevenNash
//
//  Created by gongsheng on 2020/11/19.
//  Copyright © 2020 gongsheng. All rights reserved.
//

import Foundation


let dummy = [
    "buuy the milk",
    "Take my dog",
    "Rent a car"
]


struct ToDoStore {
    static let shared = ToDoStore()
    func getToDoItmes(compltionHandler: (([String]) -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            compltionHandler?(dummy)
        }
    }
}
