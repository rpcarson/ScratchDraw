//
//  ScratchView.swift
//  ScratchDraw
//
//  Created by Reed Carson on 5/14/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class ScratchView: UIView {
    
    var currentColor = UIColor.blackColor()
    var currentShapeType: ScratchType = ScratchType.Line
    var scratches: [Scratch] = []
        
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, 5.0)
        CGContextSetLineCap(context, CGLineCap.Round)
        
        UIColor.blackColor().set()
        
        for scratch in scratches {
            
                switch scratch.type {
                    
                case .Ellipse:
                    scratch.drawEllipseWithContext(context!)
                    
                case .Line:
                    scratch.drawLineWithContext(context!)
                    
                case .Rect:
                    scratch.drawRectWithContext(context!)
                    
                case .Triangle:
                    scratch.drawTriangleWithContext(context!)
                    
                }
            
        }
    }
    
    func newScratchWithStartPoint(point: CGPoint) {
        
        let scratch = Scratch()
        scratch.points = [point,point]
        scratch.type = currentShapeType
        scratch.fillColor = currentColor
        scratches.append(scratch)
        setNeedsDisplay()
        
    }
    
    func updateCurrentScratchWithLastPoint(point: CGPoint) {
        
        if scratches.last != nil {
            scratches[scratches.count - 1].points[1] = point
            setNeedsDisplay()
            
        }
        
    }
    
    func addPointToCurrentScratch(point: CGPoint) {
        
        if scratches.count > 0 {
            scratches[scratches.count - 1].points.append(point)
            setNeedsDisplay()
        }
    }
    
    
    
}


