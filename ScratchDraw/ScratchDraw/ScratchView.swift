//
//  ScratchView.swift
//  ScratchDraw
//
//  Created by Reed Carson on 5/14/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class ScratchView: UIView {
    
    var lineSize = 5.0
    var currentColor = UIColor.blackColor()
    var fillColor = UIColor.redColor()
    var scratches: [Scratch] = []
    
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, CGFloat(lineSize))
        CGContextSetLineCap(context, kCGLineCapRound)
        
        UIColor.blackColor().set()
        
        for scratch  in scratches {

            if let firsPoint = scratch.points.first {
                
                if let fillColor = scratch.fillColor {
                    
                    fillColor.set()
                    
                    CGContextMoveToPoint(context, firsPoint.x, firsPoint.y)
                    for point in scratch.points {
                        
                    CGContextAddLineToPoint(context, point.x, point.y)
                        }
                    
                    CGContextFillPath(context)
                    
                        }
                
                if let strokeColor = scratch.strokeColor {
                    
                    strokeColor.set()
                    
                    CGContextMoveToPoint(context, firsPoint.x, firsPoint.y)
                    for point in scratch.points {
                        
                    CGContextAddLineToPoint(context, point.x, point.y)
                        }
                    
                    CGContextStrokePath(context)
                    
                }
                
            }
        }
    }
    
    func newScratchWithStartPoint(point: CGPoint) {
        
        var scratch = Scratch()
        
        scratch.points = [point,point]
        scratch.strokeColor = currentColor
        scratch.fillColor = fillColor
        
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

class Scratch {
    
    var points: [CGPoint] = []
    var fillColor: UIColor?
    var strokeColor: UIColor?
    var strokeSize: Double = 0
    
    //        line dash
    //         (CGContextSetLine...
    //        line cap
    //        line join
}

