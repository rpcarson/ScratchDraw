//
//  ScratchView.swift
//  ScratchDraw
//
//  Created by Reed Carson on 5/14/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class ScratchView: UIView {
    
    
    
    
    
    
    //
    //    var fillEnable = fillOn
    
    var fillColorz = UIColor.redColor()
    
    var currentColor = UIColor.blackColor()
    
    var scratches: [Scratch] = []
    
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, 5.0)
        CGContextSetLineCap(context, kCGLineCapRound)
        UIColor.blackColor().set()
        
        
        for scratch  in scratches {
            
            func fillSwitch()   {
                
                                    
                                    if fillOn == true   {
                    
                    
                    CGContextFillPath(context)
                    println("enabled")
                
                
                }
            }
            CGContextSetAlpha(context, scratch.strokeAlpha)
            
            fillSwitch()
            
            if let firsPoint = scratch.points.first {
                
                
                if let fillColor = scratch.fillColor {
                    
                    fillColor.set()
                    
                    CGContextMoveToPoint(context, firsPoint.x, firsPoint.y)
                    
                    for point in scratch.points {
                        
                        CGContextAddLineToPoint(context, point.x, point.y)
                        
                        
                        CGContextSetLineWidth(context, CGFloat(scratch.strokeSize))
                        
                        
                        
                    }
                    
                }
                if let strokeColor = scratch.strokeColor {
                    
                    strokeColor.set()
                    
                    CGContextMoveToPoint(context, firsPoint.x, firsPoint.y)
                    for point in scratch.points {
                        CGContextAddLineToPoint(context, point.x, point.y)
                        
                        CGContextSetLineWidth(context, CGFloat(scratch.strokeSize))
                        
                    }
                    
                }
                
                //                func fillSwitch(){
                //                    if fillOn == true{
                //
                //
                //                    CGContextFillPath(context)
                //                        println("enabled")}
                //
                //
                //                }
                
                
                fillSwitch()
                //                CGContextFillPath(context)
                
                CGContextStrokePath(context)
                
                
            }
        }
    }
    
    func newScratchWithStartPoint(point: CGPoint) {
        
        
        var scratch = Scratch()
        scratch.points = [point,point]
        
        scratch.fillColor = fillColorz
        scratch.strokeColor = currentColor
        scratch.strokeSize = publicStrokeSize
        scratch.strokeAlpha = publicStrokeAlpha
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
    var strokeSize = 0
    var strokeAlpha: CGFloat = 1.0
    
    //        line dash
    //         (CGContextSetLine...
    //        line cap
    //        line join
    
    
    
    
    
    var frustration = Int()
    
    
    func coding() {
        
        
        if frustration > 7 {
            
            flipTable()
            
        }
        
    }
    
    func flipTable() {
        
        println("arggghhhh")
    }
    
    
    
    
    
}

