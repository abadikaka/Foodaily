//
//  PopUpTitleCell.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/19/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import UIKit

class PopUpTitleCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}


class PopUpCategoryCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
}

class PopUpPostCell: UITableViewCell {
    
    @IBOutlet weak var postButton: RoundedButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
    private func setupButton(){
        postButton.setButtonProperties(cornerRadius: 10, backgroundColor: UIColor(rgb:0x96281B), titleColor: .white, titleColorHighlighted: UIColor(rgb: 0x2c3e50), borderColor: .black, borderWidth: 0)
    }
    
    @IBAction func handlePostButton(_ sender: Any) {
        
        
    }
}


class PopUpIngredientStepCell: UITableViewCell {
    
    @IBOutlet weak var addButton: RoundedButton!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    var cellId: Int?
    
    var delegate: CellAddedDelegate?{
        didSet{
            numberLabel.text = String(addButton.tag + 1)
        }
    }
    var item: PopUpViewModelItem?
    let imageButtonName = "plus"
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAddPostButton()
    }
    
    private func setupAddPostButton(){
        addButton.setButtonProperties(cornerRadius: addButton.frame.width / 2, backgroundColor: UIColor.white, titleColor: UIColor.white, titleColorHighlighted: UIColor.white, borderColor: UIColor.clear, borderWidth: 0)
        addButton.setImage(UIImage(named: imageButtonName), for: .normal)
    }
    
    @IBAction func addMoreCell(_ sender: Any) {
        if item?.type == .ingredient {
            delegate?.addedNewCell(inSection: 2, cellId: addButton.tag + 1)
        }else{
            delegate?.addedNewCell(inSection: 3, cellId: addButton.tag + 1)
        }

    }
    
    
}
