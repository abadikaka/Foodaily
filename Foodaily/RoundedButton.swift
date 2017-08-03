//
//  RoundedButton.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/2/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    private var layerBackgroundColor: UIColor?
    
    override open var isHighlighted: Bool {
        didSet {
            //backgroundColor = isHighlighted ? UIColor(rgb: 0x27ae60) : self.layerBackgroundColor
        }
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    public func setButtonProperties(cornerRadius: CGFloat, backgroundColor: UIColor, titleColor: UIColor, titleColorHighlighted: UIColor, borderColor: UIColor, borderWidth: CGFloat){
        
        layer.cornerRadius = cornerRadius;
        layer.masksToBounds = true;
        layerBackgroundColor = backgroundColor
        layer.backgroundColor = backgroundColor.cgColor
        setTitleColor(titleColor, for: .normal)
        setTitleColor(titleColorHighlighted , for: .highlighted)
        
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }

}
