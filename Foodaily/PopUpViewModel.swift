//
//  PopUpViewModel.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/19/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import Foundation
import UIKit

enum PopUpViewModelItemType {
    case title
    case category
    case ingredient
    case step
    case post
}

protocol PopUpViewModelItem {
    var type: PopUpViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

class PopUpViewModel: NSObject {
    var cellDelegate: CellAddedDelegate?
    var items = [PopUpViewModelItem]()
    var foodCategory = [FoodCategory]()
    var heightAtIndexPath = NSMutableDictionary()
    
    override init() {
        super.init()        
        setupSection()
    }
    
    private func setupSection(){
        
        /*Hardcoded Section*/
        let title = PopUpModelTitle(placeholder: "Put your title here..")
        items.append(title)
        
        let western = FoodCategory(name: "Western Category")
        foodCategory.append(western)
        let foodCat = PopUpModelCategory(foodCategory: foodCategory)
        items.append(foodCat)
        
        let ingredient = PopUpModelIngredient()
        items.append(ingredient)
        
        let step = PopUpModelStep()
        items.append(step)
        
        let post = PopUpModelPost(title: "POST")
        items.append(post)
        
    }
    
    
}

extension PopUpViewModel: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .title:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PopUpTitleCell.identifier, for: indexPath) as? PopUpTitleCell {
                return cell
            }
        case .category:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PopUpCategoryCell.identifier, for: indexPath) as? PopUpCategoryCell {
                return cell
            }
        case .ingredient:
            if let item = item as? PopUpModelIngredient, let cell = tableView.dequeueReusableCell(withIdentifier: PopUpIngredientStepCell.identifier, for: indexPath) as? PopUpIngredientStepCell {
                //cell.cellId = indexPath.row
                cell.addButton.tag = indexPath.row
                cell.item = item
                cell.delegate = cellDelegate
                return cell
            }
        case .step:
            if let item = item as? PopUpModelStep, let cell = tableView.dequeueReusableCell(withIdentifier: PopUpIngredientStepCell.identifier, for: indexPath) as? PopUpIngredientStepCell {
                //cell.cellId = indexPath.row
                cell.addButton.tag = indexPath.row
                cell.item = item
                cell.delegate = cellDelegate
                return cell
            }
        case .post:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PopUpPostCell.identifier, for: indexPath) as? PopUpPostCell {
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == items.count - 1 {
            return nil
        }else{
            return items[section].sectionTitle
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == items.count - 1 {
            return CGFloat.leastNonzeroMagnitude
        }else{
            return 32.0
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    /*func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = heightAtIndexPath.object(forKey: indexPath) as? NSNumber {
            return CGFloat(height.floatValue)
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let height = NSNumber(value: Float(cell.frame.size.height))
        heightAtIndexPath.setObject(height, forKey: indexPath as NSCopying)
    }*/
}


class PopUpModelTitle: PopUpViewModelItem {
    var type: PopUpViewModelItemType {
        return .title
    }
    
    var sectionTitle: String {
        return "Title"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var placeholder: String
    
    init(placeholder: String) {
        self.placeholder = placeholder
    }
}

class PopUpModelCategory: PopUpViewModelItem {
    var type: PopUpViewModelItemType {
        return .category
    }
    
    var sectionTitle: String {
        return "Category"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var foodCategory: [FoodCategory]
    
    init(foodCategory: [FoodCategory]) {
        self.foodCategory = foodCategory
    }
}

class PopUpModelIngredient: PopUpViewModelItem {
    var type: PopUpViewModelItemType {
        return .ingredient
    }
    
    var sectionTitle: String {
        return "Ingredients"
    }
    
    var rowCount: Int {
        return ingredientsCell
    }
    
    var ingredientsCell = 1
    
    init() {
        
    }
}

class PopUpModelStep: PopUpViewModelItem {
    var type: PopUpViewModelItemType {
        return .step
    }
    
    var sectionTitle: String {
        return "Steps"
    }
    
    var rowCount: Int {
        return stepsCell
    }
    
    var stepsCell = 1
    
    init() {
        
    }
}

class PopUpModelPost: PopUpViewModelItem {
    var type: PopUpViewModelItemType {
        return .post
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var rowCount: Int {
        return 1
    }
    
    var title : String
    
    init(title: String) {
        self.title = title
    }
}


struct FoodCategory {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
}

struct Ingredient {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
}

struct Step {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
}




