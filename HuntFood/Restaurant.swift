//
//  Restaurant.swift
//  HuntFood
//
//  Created by noprom on 15/9/5.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

// 餐厅实体类
class Restaurant {
    var name:String = ""
    var type:String = ""
    var location:String = ""
    var image:String = ""
    var isVisited:Bool = false
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
