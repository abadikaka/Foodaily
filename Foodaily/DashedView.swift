//
//  DashedView.swift
//  Foodaily
//
//  Created by Michael Abadi on 8/13/17.
//  Copyright © 2017 Michael Abadi Santoso. All rights reserved.
//

import UIKit

class DashedView: UIView {

    
    override func draw(_ rect: CGRect) {

        let borderLayer  = dashedBorderLayerWithColor(color: UIColor(rgb: 0x96281B).cgColor)
        layer.addSublayer(borderLayer)
    
    }

    private func dashedBorderLayerWithColor(color:CGColor) -> CAShapeLayer {
        
        let  borderLayer = CAShapeLayer()
        borderLayer.name  = "borderLayer"
        let frameSize = frame.size
        let shapeRect = CGRect(x: 0, y:0, width: frameSize.width, height: frameSize.height)
        
        borderLayer.bounds=shapeRect
        borderLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = color
        borderLayer.lineWidth=2.0
        borderLayer.lineJoin=kCALineJoinRound
        borderLayer.lineDashPattern = NSArray(array: [NSNumber(value: 4),NSNumber(value:4)]) as? [NSNumber]
        
        let path = UIBezierPath.init(roundedRect: shapeRect, cornerRadius: 10)
        
        borderLayer.path = path.cgPath
        
        return borderLayer
        
    }
}
