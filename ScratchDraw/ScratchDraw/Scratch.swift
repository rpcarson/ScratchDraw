//
//  Scratch.swift
//  ScratchDraw
//
//  Created by Reed Carson on 3/29/16.
//  Copyright © 2016 Reed Carson. All rights reserved.
//

import UIKit


enum ScratchType {
    
    case Line
    case Rect
    case Ellipse
    case Triangle
}


class Scratch {
    
    var points: [CGPoint] = []
    var fillColor: UIColor = .blackColor()
    var strokeColor: CGColor = UIColor.redColor().CGColor
    var strokeAlpha: CGFloat = 1
    var strokeSize: CGFloat = 10
    var type: ScratchType = .Line
    
    
    func drawLineWithContext(context: CGContextRef) {
        
            fillColor.set()
        
       
       
            // CGContextSetStrokeColorWithColor(context, strokeColor)
        
            CGContextSetLineCap(context, CGLineCap.Round)
            CGContextSetLineJoin(context, .Round)
        
            CGContextSetAlpha(context, strokeAlpha)
            CGContextSetLineWidth(context, strokeSize)
            CGContextMoveToPoint(context, points[0].x, points[0].y)
            
            for point in points {
                CGContextAddLineToPoint(context, point.x, point.y)
            }
        
        
            CGContextStrokePath(context)
        
    }
    
    func drawEllipseWithContext(context: CGContextRef) {
        
            fillColor.set()
            
            let x = points[0].x
            let y = points[0].y
            let width = points[1].x - points[0].x
            let height = points[1].y - points[0].y
            let rect = CGRectMake(x, y, width, height)
            CGContextFillEllipseInRect(context, rect)
        
    }
    
    func drawRectWithContext(context: CGContextRef) {
        
            fillColor.set()
            
            let x = points[0].x
            let y = points[0].y
            let width = points[1].x - points[0].x
            let height = points[1].y - points[0].y
            let rect = CGRectMake(x, y, width, height)
            
        CGContextFillRect(context, rect)
        
        
    }
    
    
    func drawTriangleWithContext(context: CGContextRef) {
        
            fillColor.set()
            
            let midX = (points[0].x + points[1].x) / 2
            
            CGContextMoveToPoint(context, points[1].x, points[1].y)
            CGContextAddLineToPoint(context, points[0].x, points[1].y)
            CGContextAddLineToPoint(context, midX, points[0].y)
            CGContextAddLineToPoint(context, points[1].x, points[1].y)
            
            CGContextFillPath(context)
        
    }

    
}