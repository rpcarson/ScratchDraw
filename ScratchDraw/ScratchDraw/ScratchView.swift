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
    var currentAlpha: CGFloat = 1
    var currentSize: CGFloat = 10
    var currentShapeType: ScratchType = ScratchType.Line
    var scratches: [Scratch] = []

    
    override func drawRect(rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        for scratch in scratches {
            
                switch scratch.type {
                    
                case .Ellipse:
                    scratch.drawEllipseWithContext(context)
                    
                case .Line:
                    scratch.drawLineWithContext(context)
                    
                case .Rect:
                    scratch.drawRectWithContext(context)
                    
                case .Triangle:
                    scratch.drawTriangleWithContext(context)
                    
                }
            
        }
    }
    
    func newScratchWithStartPoint(point: CGPoint) {
        
        let scratch = Scratch()

        scratch.points = [point,point]
        scratch.type = currentShapeType
        scratch.fillColor = currentColor
        scratch.strokeAlpha = currentAlpha
        scratch.strokeSize = currentSize
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
    
    func undoScratch() {
        if scratches.count > 0 {
            scratches.removeLast()
            setNeedsDisplay()
        }
    }
    
    
    
}


