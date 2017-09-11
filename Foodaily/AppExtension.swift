//
//  AppExtension.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/2/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//


import Foundation
import UIKit

struct AppFontName {
    static let regular = "CourierNewPSMT"
    static let bold = "CourierNewPS-BoldMT"
    static let italic = "CourierNewPS-ItalicMT"
}

extension UIFont {
    
    class func navigationTitleFont() -> UIFont? {
        return UIFont(name: "OpenSans-Semibold", size: 20.0)
    }
    class func pageMenuLabelFont() -> UIFont? {
        return UIFont(name: "OpenSans-Semibold", size: 15.0)
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func dropShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
}

extension UIImage {
    func resizeImageWithWidth (sourceImage:UIImage, scaledToWidth: CGFloat) -> UIImage {
        let oldWidth = sourceImage.size.width
        let scaleFactor = scaledToWidth / oldWidth
        
        let newHeight = sourceImage.size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor
        
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        sourceImage.draw(in: CGRect(x:0, y:-200, width:newWidth, height:newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func resizeImageWithHeight(sourceImage: UIImage, scaledToHeight: CGFloat) -> UIImage {
        let scale = scaledToHeight / sourceImage.size.height
        let newWidth = sourceImage.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: scaledToHeight))
        sourceImage.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: scaledToHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
