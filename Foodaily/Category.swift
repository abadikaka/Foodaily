//
//  Category.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/12/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import UIKit

struct Category {
    var name:String?
    var group:String?
    var image:String?
    
    init(name: String, group: String, image: String) {
        self.name = name
        self.group = group
        self.image = image
    }
}
