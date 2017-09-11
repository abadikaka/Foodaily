//
//  CategoryDataSource.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/12/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import Foundation

class CategoryDataSource {
    
    init() {
        populateData()
    }
    
    var categories:[Category] = []
    var groups:[String] = []
    
    
    func numbeOfRowsInEachGroup(index: Int) -> Int {
        return categoryInGroup(index: index).count
    }
    
    func numberOfGroups() -> Int {
        return groups.count
    }
    
    func gettGroupLabelAtIndex(index: Int) -> String {
        return groups[index]
    }
    
    // MARK:- Populate Data from plist
    
    func populateData() {
        if let path = Bundle.main.path(forResource: "Category", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let group = dict["group"] as! String
                        let image = dict["image"] as! String
                        
                        let category = Category(name: name, group: group, image: image)
                        if !groups.contains(group){
                            groups.append(group)
                        }
                        categories.append(category)
                    }
                }
            }
        }
    }
    
    // MARK:- CategoryForEachGroup
    func categoryInGroup(index: Int) -> [Category] {
        let item = groups[index]
        let filteredCategory = categories.filter { (category: Category) -> Bool in
            return category.group == item
        }
        return filteredCategory
    }
}
