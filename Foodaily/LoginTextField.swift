//
//  LoginTextField.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/2/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField {
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, leftPadding*2 + 20, 0, leftPadding*2 + 20))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: leftPadding*2 + 18, dy: 0.0)
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var borderStatus: Bool = false {
        didSet {
            updateView()
        }
    }
    
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextFieldViewMode.always
            rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
            
        } else {
            leftViewMode = UITextFieldViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSForegroundColorAttributeName: color])
        
        
        if !borderStatus {
            borderStyle = UITextBorderStyle.none
            
            let maskPath: UIBezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: ([.topLeft, .topRight, .bottomLeft, .bottomRight]), cornerRadii: CGSize(width: 5.0, height: 5.0))
            let maskLayer: CAShapeLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            layer.mask = maskLayer
            let borderLayer: CAShapeLayer = CAShapeLayer()
            borderLayer.frame = self.bounds
            borderLayer.path = maskPath.cgPath
            borderLayer.fillColor = UIColor.clear.cgColor
            contentVerticalAlignment = .center
            layer.addSublayer(borderLayer)
        }else{
            layer.cornerRadius = 5.0
            layer.borderWidth = 1.0
            layer.borderColor = UIColor.red.cgColor
        }
    }


}
