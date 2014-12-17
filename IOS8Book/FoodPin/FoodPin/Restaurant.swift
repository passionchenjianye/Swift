//
//  Restaurant.swift
//  FoodPin
//
//  Created by Tony on 12/8/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var image: String = ""
    var isVisited: Bool = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
