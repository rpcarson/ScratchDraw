//
//  RoundButton.swift
//  ScratchDraw
//
//  Created by Reed Carson on 4/2/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    var buttonSize = CGSizeMake(40, 40)
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let insetRect = CGRectInset(rect, 1, 1)
        
        UIColor.blueColor().set()
        
        CGContextStrokeEllipseInRect(context, insetRect)
        
        CGContextFillEllipseInRect(context, insetRect)
        
    }
    
    
}
